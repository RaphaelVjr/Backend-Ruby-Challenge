class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :new]

  def index
    @user = User.find_by(email: params[:email])
    if @user
      head :ok
    else
      head :not_found
    end
  end
 
  def create
    @user = User.new(user_params) 
    if User.exists?(email: @user.email)
      render json: { error: 'User already exists' }, status: :conflict
    else
      if @user.save
        EmailWorker.perform_async(@user.id)
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end
  
  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
