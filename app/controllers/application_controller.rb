class ApplicationController < ActionController::API  
  before_action :authenticated
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :param_missing
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

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

  def not_found(e)
    render json: { error: e }, status: :not_found
  end

  def param_missing
    render json: { error: 'Missing parameter' }, status: :unprocessable_entity
  end

  def invalid_record(e)
    render json: { error: e }, status: :unprocessable_entity
  end



end