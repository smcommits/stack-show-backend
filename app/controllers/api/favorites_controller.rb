class Api::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create 
    @favorite = current_user.favorites.create!(project_id: params[:project_id])
    render json: @favorite
  end
end
