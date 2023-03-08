module Api
  class ProjectsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
      @projects = Project.order(created_at: :desc).paginate(page: params[:page], per_page: 12)
      render json: @projects, meta: { pages: @projects.total_pages }, adapter: :json_api, key_transform: :underscore
    end

    def create
      @project = current_user.projects.create(project_params)
      render json: {
        data: {
          project: @project.user
        },
        success: 'true',
        status: 200
      }
    end

    def show
      @project = Project.with_users_and_ratings(params[:id], current_user)
      render json: @project, adapter: :attributes
    end

    private

    def project_params
      params.permit(:title, :image_path, :description, :github_url, :live_demo)
    end
  end
end
