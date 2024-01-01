class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login]

    #user controller saves username input into database and returns JWT, unless username is invalid
    def create
        @user = User.new(user_params)
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: 201
        else
            render json: { error: "Username already taken" }, status: 422
        end
    end
    
    #logs in user when given an existing username and returns a JWT
    def login
        @user = User.find_by(username: params[:user][:username])
        if @user
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: 201
        else
            render json: {error: "Invalid username or password"}
        end
    end

    private

    #accepted parameters of received comment from frontend
    def user_params
        params.require(:user).permit(:username)
    end
    
end
