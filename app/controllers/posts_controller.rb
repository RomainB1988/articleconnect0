class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Publication créée avec succès!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice] = "Publication supprimée avec succès."
    redirect_to posts_path
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Vous ne pouvez pas supprimer cette publication."
    redirect_to root_path
  end
  private

  def post_params
    params.require(:post).permit(:title, :content, :url)
  end
end
