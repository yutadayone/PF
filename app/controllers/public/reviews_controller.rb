class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_items = Tag.find_by(tags: key).reviews
          @reviews = @reviews.empty? ? tag_items : @reviews & tag_items
        end
      end
    end
    if params[:tag]
      Tag.create(tags: params[:tag])
    end
  end

  def new
    @newreview = Review.new
  end

  def create
    @review = Review.new(review_params)

    @review.customer_id = current_customer.id
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
    #@item = Item.find(params[:id])
    #@review = @item.review
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to item_review_path(params[:item_id], @review)
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:star, :introduction, :image, :item_id, :customer_id, tag_ids: [])
  end

end
