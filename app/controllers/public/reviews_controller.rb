class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @newreview = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.star = ''
    @review.item_id = params[:item_id]
    if @review.save
      redirect_to item_review_path(params[:item_id], @review), notice: "You have created review successfully."
    else

      @reviews = Review.all
      render 'index'
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:star, :introduction, :image)
  end
end
