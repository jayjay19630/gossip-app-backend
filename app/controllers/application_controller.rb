class ApplicationController < ActionController::Base
    before_action :authorized
    skip_before_action :verify_authenticity_token

    #functions for encoding and decoding username information into JWT
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end

    def decoded_token
        auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    #returns the current user if there is an existing JWT 
    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    #authorizes access to other controller actions if there is a current user logged in
    def authorized
        unless !!current_user
            render json: { message: 'Please log in' }, status: :unauthorized
        end
    end
            
end
