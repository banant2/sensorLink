module Sensor
  module V1
    class EnvDataController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @env_data = EnvDatum.order('record_time DESC');
        render json: {status: 'SUCCESS', message: 'loaded data', data: env_data}, status: :ok
      end

      def show
        @env_info = EnvDatum.where(sensor_id: params[:sensor_id])
      end

      def create
         @env_datum = EnvDatum.new(env_datum_params)
         if @env_datum.save
           render json: {status: 'SUCCESS', message: 'Saved Data', data: @env_datum}, status: :ok
         else
           render json: {status: 'ERROR', message: 'Data not saved',
             data: @env_datum.errors}, status: :unprocessable_entity
         end

         data_time = EnvDatum.select('record_time').reverse_order.limit(1)
         puts data_time.inspect
         Plant.update(params[:sensor_id],last_record: data_time[0].record_time)
         
      end

      def destroy
        @env_datum = EnvDatum.find(params[:id])
        @env_datum.destroy
        render json: {status: 'SUCCESS', message: 'Data Deleted', data: @env_datum}, status: :ok
      end

      private
        def env_datum_params
          params.permit(:sensor_id, :temp, :soil_conduct, :light)
        end

        def require_login
          unless current_user
          redirect_to new_user_session_path
        end

      end
    end
  end
end
