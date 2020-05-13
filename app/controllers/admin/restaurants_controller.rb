# frozen_string_literal: true

class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_restaurants, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  # get create new page
  def new
    @restaurant = Restaurant.new
  end

  # get show page
  def show; end

  # get edit page
  def edit; end

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

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = 'restaurant was successfully updated'
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = 'restaurant was failed to update'
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = 'restaurant was deleted!'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :opening_hours, :address, :description, :image)
  end

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end
end
