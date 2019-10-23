class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/new"
    end
  end

  def new
    @review = Review.new(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
