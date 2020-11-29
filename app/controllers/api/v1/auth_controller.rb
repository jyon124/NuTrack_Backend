class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    
    def create
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])
            token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
            render json: { error: 'Invalid Username or Password' }, status: 401
        end
    end

    def show
        token = request.headers[:Authorization]
        decoded_token = JWT.decode(token, 'app_secret', true, { algorithm: 'HS256' })
        id = decoded_token.first['id']
        user = User.find(id)
        if user
            render json: { id: user.id, username: user.username, token: token }
        else
            render json: { error: 'Not Authorized'}, status: 401
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end

end