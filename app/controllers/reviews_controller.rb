class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])		
		@review = Review.new(:restaurant => @restaurant)
	end

	def create
    @review = Review.new(params[:review].permit(:review, :score, :restaurant_id))
	  @restaurant = Restaurant.find(params[:review][:restaurant_id])

    if @review.save
      
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

end
