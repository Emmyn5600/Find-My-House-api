module Api
  module V1
    class HousesController < ApplicationController
        def index
            houses = House.all.order(Arel.sql('random()'));
            render json: {status: 'SUCCESS', message:'Loaded Houses', data:houses}, status: :ok
        end

        def show 
            house = House.find(params[:id]);
            render json: {status: 'SUCCESS', message:'Loaded House', data:house}, status: :ok
        end

        def create
          user ||= user.find(house_params[:user_id])
          if user             
           house = user.houses.build(house_params)
           if house.save
            render json: {status: 'SUCCESS', message:'Houses created successfully', data:house}, status: :ok
           else
            render json: {status: 'ERROR', message:'Houses not created succesffully', data:house.errors}, status: :unprocessable_entry
           end
          else 
            render json: {status: 404, message: 'User not found'}, status: 404
          end
        end

        private 

        def house_params
          params.permit(:name, :description, :price, :image, :user_id);
        end
    end
  end
end