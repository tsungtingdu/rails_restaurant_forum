# frozen_string_literal: true

class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
     @restaurant = Restaurant.find(paramrs[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'restaurant was successfully created'
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = 'restaurant was failed to create'
      render :new
    end
  end

  private

  def restaurant_params
    paramts.requrire(:restaurant).permit(:name, :tel, :opening_hours, :address, :description)
  end
end
