module Api
  module V1
    class RentsController < ApplicationController
      before_action :authorize_request

      def index
        @rent = Rent.all.order(Arel.sql('random()'))
        render json: @rent, status: 200
      end

      def show
        user ||= User.find_by(id: params[:id])
        if user.nil?
          render json: { message: "User not found with ID #{params[:id]} doesn't exist" }, status: 404
        else
          rent = user.rents.order('created_at DESC')
          render json: rent, status: 200
        end
      end

      def create # rubocop:disable Metrics/PerceivedComplexity
        user ||= User.find_by(id: rent_params[:user_id])
        if user.nil?
          render json: { message: "User not found with ID #{rent_params[:user_id]}" }, status: 404
        else
          rent = Rent.find_by(user_id: user.id, house_id: rent_params[:house_id])
          if rent.nil?
            rent = user.rents.build(rent_params)
            house = House.find_by(id: rent_params[:house_id])
            if house.nil?
              render json: { message: "house not found with ID #{rent_params[:house_id]}" },
                     status: 404
            elsif rent.save
              render json: rent, status: 200
            else
              render json: { message: rent.errors.full_messages[0] }, status: 400
            end
          else
            render json: { message: 'rent already exists' }, status: 400
          end
        end
      end

      def destroy
        rent ||= Rent.find_by(id: params[:id])
        if rent.nil?
          render json: { message: "rent not found with ID #{params[:id]}" }, status: 404
        else
          rent.destroy
          render json: { message: "rent with ID #{params[:id]} has been deleted", data: rent }, status: 200
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:house_id, :user_id)
      end
    end
  end
end
