class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index #GET
    @restaurants = Restaurant.all
  end

  def new #GET
    @restaurant = Restaurant.new
  end

  def create #POST
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
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
    if @restaurant.user == current_user
      @restaurant.update(restaurant_params)
    end
    redirect_to restaurants_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.user == current_user
      @restaurant.destroy
    end
    redirect_to restaurants_path, :flash => { :notice => "Restaurant deleted successfully" }
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
