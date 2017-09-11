class WelcomeController < ApplicationController
  def show
  end

  def dashboard
    authenticated_plants = Plant.select('sensor_id', 'name').where(owner_id: current_user.id)

    l = authenticated_plants.length
    @plant_auth = Array.new(l){Array.new(3)}

    i = 0
    while i < l do
      @plant_auth[i][0] = authenticated_plants[i].sensor_id
      @plant_auth[i][1] = authenticated_plants[i].name
            #if placeholder[0].try(:soil_conduct)
      #  @plant_auth[i][2] = placeholder[0].try(:soil_conduct)
      #else
      #  @plant_auth[i][2] = 0
      #end

      i+=1
    end

    #@dash_chart = Plant.joins("INNER JOIN env_data ON env_data.record_time = plants.last_record").select('sensor_id','name','"env_data"."soil_conduct" as env_soil_conduct').where(owner_id: current_user.id)#.eager_load(:env_data)
      @result = ActiveRecord::Base.connection.select_all("SELECT plants.sensor_id, plants.name,env_data.soil_conduct as env_soil_conduct FROM plants INNER JOIN env_data ON env_data.record_time = plants.last_record WHERE plants.owner_id = 1")
      puts @result.inspect

  end
  private
    def plant_qualifier

    end
end
