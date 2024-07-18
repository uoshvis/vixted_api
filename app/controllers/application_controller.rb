class ApplicationController < ActionController::API  
  before_action :authenticated
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def encode_token(payload)
    JWT.encode(payload, 'hello123') 
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        JWT.decode(token, 'hello123', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user 
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authenticated
    unless !!current_user
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  private

  def handle_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def handle_not_found(e)
    render json: { errors: e }, status: :not_found
  end

end