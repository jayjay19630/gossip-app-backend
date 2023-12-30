class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    #user controller saves username input into database, unless username is invalid
    def create
        user = User.new(user_params)
        if user.save
            render json: user, status: 201
        else
            render json: { error: user.errors.messages }, status: 422
        end
    end
    
    private

    #accepted parameters of received comment from frontend
    def user_params
        params.require(:user).permit(:username)
    end
    
end
