class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment added successfully."
    else
      flash[:alert] = "Comment could not be saved."
    end

    redirect_to post_path(@post)
  end
  def destroy
    @comment = current_user.comments.find(params[:id])
    puts "Comment found: #{@comment}"

    if @comment.destroy
      puts "Comment successfully destroyed."
      flash[:notice] = "Comment deleted successfully."
    else
      puts "Failed to destroy the comment."
      flash[:alert] = "Failed to delete the comment."
    end

    redirect_to post_path(@comment.post)
  end
  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
