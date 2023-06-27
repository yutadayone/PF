class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @reviews = Review.all
    #タグ検索
    @review = current_customer.reviews.new
    if params[:tag_ids]
      @reviews = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_items = Tag.find_by(tags: key).reviews
          @reviews = @reviews.empty? ? tag_items : @reviews & tag_items
        end
      end
    end
    #タグ作成
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
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
    #レビュー詳細に関連付けてあるコメントを全取得
    @comments = @review.comments
    #レビュー詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
    @comment = current_customer.comments.new
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
