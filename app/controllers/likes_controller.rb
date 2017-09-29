class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.find_by(like_params)
    if Like.find_by(like_params)
      flash[:alert] = "You liked before!"
      redirect_to root_path
    else
      # @like = Like.new(user_id: params[:like][:user], status_id: params[:like][:status])
      status = Status.find(params[:like][:status])
      @like = status.likes.new(user_id: session[:user_id])
      @like.save
      flash[:notice] = "You liked #{status.title}!"
      redirect_to root_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @like = Like.find(params[:id])
    status = Status.find(@like.status_id)
    @like.destroy
    flash[:notice] = "You unlike."
    redirect_to status_path(status)
  end

  def index
  end

  def show
  end

  def like_params
    params.require(:like).permit(:status, :user)
  end
end
