class ReviewsController < ApplicationController

  def show
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    redirect_to :back
  end

  private
    def review_params
      params.require(:review).permit(:product_id, :description, :rating, :user_id)
    end
end
