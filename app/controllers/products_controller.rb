class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @product_review = Review.where(product_id: params[:id])
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @product_review.average(:rating)
     @average_rating = @product_review.average(:rating).round(2)
     @average_rating = "#{@average_rating}".sub(".0","")
    end
  end

end
