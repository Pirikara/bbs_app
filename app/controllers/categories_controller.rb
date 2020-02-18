class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @rooms = @category.rooms.includes(:messages)
  end
end
