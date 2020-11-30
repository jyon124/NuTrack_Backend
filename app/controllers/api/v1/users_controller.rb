class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
 
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: @user.errors.full_messages[0] }, status: :not_acceptable
    end
  end

  def update
    @user = current_user
    # puts @user.errors.full_messages
    if @user.valid?
        @user.update(bmr: update_user_params[:bmr])
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
      else
        render json: { message: 'Unable to update your BMR. Please verify your account.'}
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :name, :bmr, :email)
  end

  def update_user_params
    params.require(:user).permit(:username, :password, :name, :bmr, :email)
  end

end