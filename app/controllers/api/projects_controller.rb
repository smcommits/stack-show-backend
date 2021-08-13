class Api::ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = Project.all_with_users_and_ratings
    render json: @projects, status: 200
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
    @project = Project.with_users_and_ratings(params[:id])
    render json: @project
  end

  private

  def project_params
    params.permit(:title, :image_url, :description, :github_url, :live_demo)
  end
end
