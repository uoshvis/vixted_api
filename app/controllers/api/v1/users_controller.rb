class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
  
  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user, status: 200
    else
      render json: {error: "User not found"}
    end
  end

  def create 
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
        user: UserSerializer.new(user), 
        token: @token
    }, status: :created
  end

  def me 
    render json: current_user, status: :ok
  end

  private

  def user_params 
    params.permit(:username, :password, :email)
  end

  def handle_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end
end

