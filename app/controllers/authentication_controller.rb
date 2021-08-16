class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token_data = { user_id: @user.id, name: @user.name, email: @user.email }
      token = JsonWebToken.encode(token_data)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                     name: @user.name }, status: :ok
    else
      render json: { error: 'unauthorized user' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
