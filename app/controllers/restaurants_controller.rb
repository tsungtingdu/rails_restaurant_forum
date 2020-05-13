# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
