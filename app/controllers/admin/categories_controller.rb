class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with username: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
  
  before_filter :authorize

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
