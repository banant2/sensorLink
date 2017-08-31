module Sensor
  module V1
    class EnvDataController < ApplicationController
      before_action :require_login

      def index
        @env_data = EnvDatum.order('record_time DESC');
        render json: {status: 'SUCCESS', message: 'loaded data', data: env_data}, status: :ok
      end

      def show
        @env_info = EnvDatum.where(sensorID: params[:sensorID])
        @plant = Plant.find(params[:sensorID])
        puts data:@plant.name
      end

      def create
         @env_datum = EnvDatum.new(env_datum_params)

         if env_datum.save
           render json: {status: 'SUCCESS', message: 'Saved Data', data: @env_datum}, status: :ok
         else
           render json: {status: 'ERROR', message: 'Data not saved',
             data: @env_datum.errors}, status: :unprocessable_entity
         end
      end

      def destroy
        @env_datum = EnvDatum.find(params[:id])
        @env_datum.destroy
        render json: {status: 'SUCCESS', message: 'Data Deleted', data: @env_datum}, status: :ok
      end

      private
        def require_login
          unless current_user
          redirect_to new_user_session_path
        end

        def env_datum_params
          params.permit(:sensorID, :temp, :soil_conduct, :light)
        end
      end
    end
  end
end
