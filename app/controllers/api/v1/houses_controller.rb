module Api
  module V1
    class HousesController < ApplicationController
        def index
            houses = House.all.order(Arel.sql('random()'));
            render json: {status: 'SUCCESS', message:'Loaded Houses', data:houses}, status: :ok
        end

        def show 
            house = House.find(params[:id]);
            render json: {status: 'SUCCESS', message:'Loaded House', data:houses}, status: :ok
        end
    end
  end
end