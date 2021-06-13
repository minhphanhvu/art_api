class UsersController < ApplicationController
  before_action :find_user_from_route_id, only: [:show, :update, :destroy]

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def destroy
    @user.destroy
    render json: @user
  end 

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def find_user_from_route_id
    @user = User.find(params[:id])
  end
end