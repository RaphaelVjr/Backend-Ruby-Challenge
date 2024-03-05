class SessionsController < ApplicationController
  protect_from_forgery prepend: true
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    render json: { status: 'ok' }
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { status: 'ok', redirect_to: movies_path }
    else
      render json: { status: 'error', message: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { status: 'ok', redirect_to: root_path }
  end
end
