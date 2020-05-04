class SubsController < ApplicationController
    before_action :ensure_logged_in, only: [:new, :create]
    before_action :ensure_moderator, only: [:edit, :update]
    def index
        @subs = Sub.all
        render :index
    end

    def new
        @sub = Sub.new
        render :new
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.author_id = current_user.id

        if @sub.save
            redirect_to subs_url
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])

        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
        end
    end

    def ensure_moderator
        ensure_logged_in
        redirect_to subs_url unless current_user.subs.find_by(id: params[:id])
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
    
    
end
