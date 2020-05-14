# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = 'Not allow!'
      redirect_to root_path
    end
  end
end
