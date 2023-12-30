class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token

    #shows all uploaded posts in an array
    def index
        posts = Post.all
        render json: posts
    end

    #saves post content into database, unless input is invalid
    def create
        post = Post.new(post_params)
        if post.save
            render json: post, status: 201
        else
            render json: { error: post.errors.messages }, status: 422
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id, :tag_id, :likes)
    end
end
