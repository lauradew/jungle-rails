class ReviewsController < ApplicationController
  before_filter :authorize, only: [:create, :destroy]

  def show
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    current_user = User.find(session[:user_id])
    @review.user = current_user
    if @review.save
    redirect_to :back
  else
    redirect_to :back
  end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to @review.product
  end

  private
    def review_params
      params.require(:review).permit(:product_id, :description, :rating)
    end
end
