class RestaurantsController < ApplicationController

  def index #GET
    @restaurants = Restaurant.all
  end

  def new #GET
    @restaurant = Restaurant.new
  end

  def create #POST
    Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end
