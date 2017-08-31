class WelcomeController < ApplicationController
  def show
  end
  def dashboard
     @authenticated_plants = Plant.where(owner_id: current_user.id)
     puts @authenticated_plants.inspect
  end

  private
   def plant_qualifier

   end
end
