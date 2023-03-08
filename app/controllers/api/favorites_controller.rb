module Api
  class FavoritesController < ApplicationController
    before_action :authenticate_user!

    def index
      @favorite_projects = current_user.favorite_projects.paginate(page: params[:page], per_page: 12)

      render json: @favorite_projects, adapter: :json_api, key_transform: :underscore

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
end
