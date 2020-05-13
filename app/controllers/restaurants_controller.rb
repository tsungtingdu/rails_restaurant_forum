# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  private

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = 'Not allow!'
      redirect_to root_path
    end
  end
end
