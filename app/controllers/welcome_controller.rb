class WelcomeController < ApplicationController
  def show
  end

  def dashboard
    authenticated_plants = Plant.select('sensorID', "name").where(owner_id: current_user.id)

    l = authenticated_plants.length
    @plant_auth = Array.new(l){Array.new(2)}

    i = 0
    while i < l do
      @plant_auth[i][0] = authenticated_plants[i].sensorID
      @plant_auth[i][1] = authenticated_plants[i].name
      i+=1
    end


  end
  private
    def plant_qualifier

    end
end
