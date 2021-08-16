module Api
  module V1
    class HousesController < ApplicationController
      before_action :authorize_request, except: :create
      before_action :find_user, except: %i[create index]
      before_action :authorize_admin, only: [:index]
      def index
        houses = House.all.order(Arel.sql('random()'))
        render json: { status: 'SUCCESS', message: 'Loaded Houses', data: houses }, status: :ok
      end

      def show
        house = House.find_by(id: params[:id])
        if house
          render json: { status: 'SUCCESS', message: 'Loaded House', data: house }, status: :ok
        else
          render json: { message: "House not found with ID #{params[:id]}" }, status: 404
        end
      end

      def create
        user ||= User.find_by(id: house_params[:user_id])
        if user
          house = user.houses.build(house_params)
          if house.save
            render json: { status: 'SUCCESS', message: 'Houses created successfully', data: house }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Houses not created succesffully', data: house.errors },
                   status: :unprocessable_entry
          end
        else
          render json: { status: 404, message: 'User not found' }, status: 404
        end
      end

      def destroy
        house = House.find_by(id: params[:id])
        if house
          house.destroy
          render json: { status: 'SUCCESS', message: 'Houses Deleted successfully', data: house }, status: :ok
        else
          render json: { message: "House not found with ID #{params[:id]} doesn't exist" }, status: 404
        end
      end

      def update
        house = House.find_by(id: params[:id])
        if house.nil?
          render json: { message: "house not found with ID #{params[:id]}" }, status: 404
        else
          user ||= User.find_by(id: house_params[:user_id])
          if user.nil?
            render json: { message: "User not found with ID #{house_params[:author_id]}" }, status: 404
          elsif house.update(house_params)
            render json: house, status: 200
          else
            render json: { message: house.errors.full_messages[0] }, status: 400
          end
        end
      end

      private

      def house_params
        params.permit(:name, :description, :price, :image, :user_id)
      end
    end
  end
end
