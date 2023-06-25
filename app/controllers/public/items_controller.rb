class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @newitem = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.customer = current_customer
    if @item.save
      redirect_to items_path
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @genre = @item.genre
    @reviews = @item.reviews
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @Item = Item.find(params[:id])
    if @Item.update(item_params)
      redirect_to item_path
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :genre_id, :image)
  end
end
