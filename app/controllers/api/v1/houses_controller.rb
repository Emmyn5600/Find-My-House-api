module Api
  module V1
    class HousesController < ApplicationController
        def index
            houses = House.order('created_at DEC');
            render json: {status: 'SUCCESS', message:'Loaded Houses', data:houses}, status: :ok
        end
    end
  end
end