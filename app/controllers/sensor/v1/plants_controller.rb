module Sensor
  module V1
    class PlantsController < ApplicationController

      def index
        @plant = Plant.order('sensorID DESC');
        render json: {status: 'SUCCESS', message: 'loaded plant', data: @plant}, status: :ok
      end

      def new
        @plant = Plant.new

      end

      def show
        @plant = Plant.find(params[:sensorID])
        render json: {status: 'SUCCESS', message: 'loaded plant', data: plant}, status: :ok
      end

      def create
        @user = current_user
        @plant = Plant.new(plant_params)

        if @plant.save
          redirect_to root_path, notice: 'Plant Created Successfully'
        else
          render action: 'new'
        end
      end

      def update

        @plant = Plant.find(params[:sensorID])
        if plant.update_attributes(plant_params)
            redirect_to sensor_v1_plant_path, notice: 'Plant Updated Successfully'
        else
            render action: 'new'
        end
      end

      private
      def plant_params
        params.require(:plant).permit(:sensorID, :name, :sci_name, :nickname, :zipcode, :notes, :owner_id)
      end
    end
  end
end
