class PostsController < ApplicationController
    before_action :ensure_logged_in, only: [:new, :create]
    before_action :ensure_author, only: [:edit, :update]

    def index
        @posts = Post.all
        render :index
    end

    def new
        @post = Post.new
        @subs = Sub.all
        render :new
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id

        if @post.save
            redirect_to posts_url
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
        end
    end

    def ensure_author
        ensure_logged_in
        redirect_to posts_url unless current_user.posts.find_by(id: params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end

    
end
