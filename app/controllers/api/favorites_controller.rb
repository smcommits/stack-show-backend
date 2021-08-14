class Api::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_projects = Favorite.current_user_favorites(current_user)
    render json: @favorite_projects
  end

  def create
    @favorite = current_user.favorites.create!(favorite_params)
    render json: @favorite
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    render json: { success: true } if @favorite.destroy
  end

  private

  def favorite_params
    params.require(:params).permit(:project_id)
  end
end
