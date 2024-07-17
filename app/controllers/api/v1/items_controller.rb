class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items, status: 200
  end

  def show
    if @item
      render json: @item, status: 200
    else
      render json: {error: "Item not found"}
    end
  end

  def create
    item = Item.new(
      title: item_params[:title],
      description: item_params[:description],
      price: item_params[:price],
    )

    item.user_id = current_user.id
    
    if item.save
      render json: item, status: 200
    else
      render json: {error: "Error creating item"}
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

    def item_params
      params.require(:item).permit([
        :title,
        :description,
        :price
      ])
    end
end
