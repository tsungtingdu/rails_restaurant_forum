# frozen_string_literal: true

class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_category, only: %i[update destroy]

  def index
    @categories = Category.all
    @category = Category.new

    @category = if params[:id]
                  Category.find(params[:id])
                else
                  Category.new
                end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'New category was created successfully!'
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = 'category was successfully updated'
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
    flash[:alert] = 'category was deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
