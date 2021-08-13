class Api::SearchController < ApplicationController
  before_action :authenticate_user!

  def projects
    @projects = Project.filter_by_starts_with(params[:query])
    render json: @projects
  end
end
