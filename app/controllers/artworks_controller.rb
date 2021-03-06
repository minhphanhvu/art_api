class ArtworksController < ApplicationController
  # Assume :user_id always valid
  before_action :find_user_by_id, only: [:index, :create]
  before_action :find_artwork_by_id, only: [:show, :update, :destroy]

  def index
    render json: { :owned_artworks => @user.artworks, :shared_artworks => @user.shared_artworks }
  end

  def create
    @artwork = @user.artworks.build(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    if @artwork
      render json: @artwork
    else
      render json: ['Artwork not found'], status: '404'
    end
  end

  def update
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork.destroy
    render json: @artwork
  end

  def like
    artworks = User.find_by_id(params[:id]).liked_artworks
    render json: artworks
  end

  def liking_users
    users = Artwork.find_by_id(params[:id]).liking_viewers
    render json: users
  end

  def favorites
    favorites = User.find_by_id(params[:id]).shared_artworks.where(favorite: true)
    render json: favorites
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :favorite)
  end

  def find_user_by_id
    @user = User.find_by_id(params[:user_id])
  end

  def find_artwork_by_id
    @artwork = find_user_by_id.artworks.find_by_id(params[:id])
  end
end