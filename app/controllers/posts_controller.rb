class PostsController < ApplicationController

    #shows all uploaded posts in an array
    def index
        posts = Post.all
        post_with_tags = posts.map do |post|
            { "post" => post, "username" => post_user_finder(post), "tags" => tag_finder(post) }
        end
        render json: post_with_tags
    end
    
    #show a specific post with an id, its tags and comments
    def show
        post = Post.find(params[:id])
        comments = Comment.where(post_id: params[:id])

        render json: {
            post: post,
            username: post_user_finder(post),
            tags: tag_finder(post),
            comments: comments.map { |comment| {'id' => comment.id, 'content' => comment.content, 'username' => comment_user_finder(comment), 'created_at' => comment.created_at} }
        }
    end

    #show a specific post with an id and its tags during editing
    def edit
        post = Post.find(params[:id])
        render json: {
            post: post,
            tags: tag_finder(post)
        }
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

    private

        #accepted parameters of received post from frontend
        def post_params
            params.require(:post).permit(:title, :content, :user_id, :tag_ids, :likes)
        end
    
        #finds all tags related to a post
        def tag_finder(post)
            tag_ids = PostTag.where(post_id: post[:id]).map{ |posttag| posttag.tag_id }
            tags = tag_ids.map{ |tagid| Tag.find(tagid)[:tag_name] }
        end

        #finds user of the post
        def post_user_finder(post)
            username = User.find(post[:user_id]).username
        end

        #finds user of comment
        def comment_user_finder(comment)
            user_id = comment.user_id
            username = User.find(user_id).username
        end


        #first destroys all tags, takes in tags and adds then each post-tag combination to database
        def create_or_delete_posts_tags(post, tag_ids)
            post.tags.destroy_all
            tag_ids.each do |tag_id|
                post.tags << Tag.find(tag_id)
            end
        end

end
