module Sensor
  module V1
    class EnvDataController < ApplicationController
      def show
        @plant = Plant.find(params[:id])
        render json: {status: 'SUCCESS', message: 'loaded plant', data: plant}, status: :ok
      end

      def new
        @plant = Plant.new
      end

      def create
        @plant = Plant.new(plant_params)

        if @plant.save
          redirect_to sensor_v1_plant_path, notice: 'Plant Created Successfully'
        else
          redirect_to sensor_v1_plant_path, notice: 'Error Updating Plant'
        end

      end

      def update
        @plant = Plant.find(params[:id])
        if plant.update_attributes(plant_params)
            redirect_to sensor_v1_plant_path, notice: 'Plant Updated Successfully'
        else
            render action: 'new'
        end
      end
    end


    private
      def plant_params
        params.permit(:sensorID, :name, :sci_name, :nickname, :zipcode, :notes)
      end
    end
  end
end
