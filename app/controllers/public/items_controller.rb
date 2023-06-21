class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @newitem = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render "new"
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction)
  end
end
