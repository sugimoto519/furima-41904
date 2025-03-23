class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end 

  private

  def item_params
    params.require(:item).permit(:image)
  end
  
end
