class Api::V1::ItemsController < ApplicationController  
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :authenticated, only: [:create, :update, :destroy]
  before_action :authorized, only: [:update, :destroy]
  
  def index
    if params[:user_id]
      items = User.find_by(id: params[:user_id]).items
    else
      items = Item.all
    end
    render json: items, status: 200
  end

  def show
      render json: @item, status: :ok
  end

  def create
    item = Item.new(item_params)

    item.user_id = current_user.id
    
    if item.save!
      render json: item, status: :created
    end
  end

  def update
    if @item.update!(item_params)
      render json: @item, status: :accepted
    end
  end

  def destroy
    if @item.delete
      render json: { message: 'Item deleted successfully' }, status: :ok
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
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

  def authorized
    unless @item.user == current_user
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end
  
end
