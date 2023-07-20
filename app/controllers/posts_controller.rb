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
    @post.comments.destroy_all  # Supprimer les commentaires associés à la publication
    @post.destroy
    flash[:notice] = "Publication supprimée avec succès."
    redirect_to posts_path
  rescue ActiveRecord::RecordNotFound
    # Gérer l'erreur si la publication n'est pas trouvée
    flash[:alert] = "Publication introuvable."
    redirect_to posts_path
  end
  private

  def post_params
    params.require(:post).permit(:title, :content, :url)
  end
end
