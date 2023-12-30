class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token

    #shows all uploaded posts in an array
    def index
        posts = Post.all
        render json: posts
    end
    
    #show a specific post with an id
    def show
        post = Post.find(params[:id])
        render json: post
    end

    #saves post content into database, unless input is invalid
    def create
        post = Post.new(post_params.except(:tag_ids))
        create_or_delete_posts_tags(post, params[:post][:tag_ids])
        if post.save
            render json: post, status: 201
        else
            render json: { error: post.errors.messages }, status: 422
        end
    end

    #retrieves post content to be changed by the user
    def edit
        post = Post.find(params[:id])
    end
    
    #updates the post content if input is valid
    def update
        post = Post.find(params[:id])
        create_or_delete_posts_tags(post, params[:post][:tag_ids])
        if post.update(post_params.except(:tag_ids))
            render json: post, status: 200
        else 
            render json: { error: post.erros.messages }, status: 422
        end
    end
    
    #deletes record in database
    def destroy
        post = Post.find(params[:id])
        post.destroy
    end

    #accepted paramters of received post from frontend
    private
        def post_params
            params.require(:post).permit(:title, :content, :user_id, :tag_ids, :likes)
        end

    #first destroys all tags, takes in tags and adds then each post-tag combination to database
    private
        def create_or_delete_posts_tags(post, tag_ids)
            post.tags.destroy_all
            tag_ids.each do |tag_id|
                post.tags << Tag.find(tag_id)
            end
        end
end
