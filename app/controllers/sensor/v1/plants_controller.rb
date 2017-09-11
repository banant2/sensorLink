module Sensor
  module V1
    class PlantsController < ApplicationController
      before_action :require_login

      def index
        @plant = Plant.order('sensor_id DESC');
        render json: {status: 'SUCCESS', message: 'loaded plant', data: @plant}, status: :ok
      end

      def new
        @plant = Plant.new
      end

      def show
        @plant = Plant.find(params[:sensor_id])
        puts @plant.inspect
        render json: {status: 'SUCCESS', message: 'loaded plant', data: plant}, status: :ok
      end

      def create
        @plant = Plant.new(plant_params)

        if @plant.save
          redirect_to root_path, notice: 'Plant Created Successfully'
        else
          render action: 'new'
        end
      end

      def update

        @plant = Plant.find(params[:sensor_id])
        if plant.update_attributes(plant_params)
            redirect_to sensor_v1_plant_path, notice: 'Plant Updated Successfully'
        else
            render action: 'new'
        end
      end

      private
        def require_login
          unless current_user
          redirect_to new_user_session_path
        end

        def plant_params
          params.require(:plant).permit(:sensor_id, :name, :sci_name, :nickname, :zipcode, :notes, :owner_id, :last_record)
        end
      end
    end
  end
end
