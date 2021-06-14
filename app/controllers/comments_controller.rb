class CommentsController < ApplicationController
  def index
    owner = request.fullpath.split('/')[1]
    if owner == 'artworks'
      artwork = Artwork.find_by_id(params[:id])
      render json: artwork.comments
    else
      user = User.find_by_id(params[:id])
      render json: user.comments
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:artwork_id, :user_id, :body)
  end
end
