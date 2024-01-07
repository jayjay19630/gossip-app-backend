class CommentsController < ApplicationController
    before_action :set_post

    #shows all available comments
    def index
        comments = @post.comments
        render json: comments, status: 200
    end

    #creates a new comment on a certain post
    def create
        comment = @post.comments.build(comment_params) 
        if comment.save
            render json: comment, status: 201
        else
            render json: { error: comment.errors.messages }, status: 422
        end
    end

    #show original comment during editing
    def edit
        comment = @post.comments.find(params[:id])
        render json: comment, status: 200
    end

    #updates an existing comment
    def update
        comment = @post.comments.find(params[:id])
        if comment.update(comment_params)
            render json: comment, status: 200
        else 
            render json: { error: comment.errors.messages }, status: 422
        end
    end

    #deletes an existing comment
    def destroy
        comment = @post.comments.find(params[:id])
        comment.destroy
    end

    private
    
        #before any action takes place, this action defines which post the comment is in
        def set_post
            @post = Post.find(params[:post_id])
        end

        #accepted parameters of received comment from frontend
        def comment_params
            params.require(:comment).permit(:content, :post_id, :user_id)
        end
        
end
