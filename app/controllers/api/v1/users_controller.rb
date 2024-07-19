class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticated, only: [:create]
  before_action :authorized_user, only: [:destroy]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: User.find(params[:id]), status: :ok
  end

  def create 
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
        user: UserSerializer.new(user), 
        token: @token
    }, status: :created
  end

  def destroy
    if @user.destroy
      render json: { message: 'User deleted successfully' }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def me 
    render json: current_user, status: :ok
  end

  private

  def user_params 
    params.permit(:username, :password, :email)
  end
    
  def authorized_user
    unless @user == current_user
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end

end

