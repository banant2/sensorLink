class WelcomeController < ApplicationController
  def show
  end

  def dashboard
    authenticated_plants = Plant.select('sensor_id', 'name').where(owner_id: current_user.id)

    l = authenticated_plants.length
    @plant_auth = Array.new(l){Array.new(3)}

    puts authenticated_plants.inspect

    i = 0
    while i < l do
      @plant_auth[i][0] = authenticated_plants[i].sensor_id
      @plant_auth[i][1] = authenticated_plants[i].name
      #@dash_chart = EnvDatum.select('soil_conduct').where(sensor_id: authenticated_plants[i].sensor_id).order(:record_time).reverse_order.limit(1)
      #if placeholder[0].try(:soil_conduct)
      #  @plant_auth[i][2] = placeholder[0].try(:soil_conduct)
      #else
      #  @plant_auth[i][2] = 0
      #end
      #puts @dash_chart.inspect
      i+=1
    end



  end
  private
    def plant_qualifier

    end
end
