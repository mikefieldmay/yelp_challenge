class RestaurantsController < ApplicationController

  def index #GET
    @restaurants = Restaurant.all
  end

  def new #GET
    @restaurant = Restaurant.new
  end

  def create #POST
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show #GET
    @restaurant = Restaurant.find(params[:id])
  end

  def edit #GET
    @restaurant = Restaurant.find(params[:id])
  end

  def update #PATCH/PUT
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, :flash => { :notice => "Restaurant deleted successfully" }
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
