class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @review.description = params[:review][:description]
    @review.rating = params[:review][:rating]
    @review.user = current_user
    @review.product_id = params[:product_id]

    if @review.save
      product_id = params[:product_id]
      redirect_to product_path(id: product_id)
    else
      redirect_to product_path(id: product_id)
    end
  end

  def delete
    product_id = params[:product_id]
    @reviewed = Review.find params[:review_id]
    @product = @reviewed.product
    @reviewed.delete
    redirect_to product_path(id: product_id)
  end

end