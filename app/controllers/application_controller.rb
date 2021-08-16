class ApplicationController < ActionController::API
  attr_reader :current_user

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def authorize_admin
    @admin = AuthorizeAdmin.new(current_user).call
    render json: { message: 'You are not Authorized to perform this action' }, status: 401 unless @admin
  end
end
