# frozen_string_literal: true

module Api
  class SearchController < ApplicationController
    before_action :authenticate_user!

    def projects
      @projects = Project.filter_by_starts_with(params[:query])
      render json: @projects
    end

    def users
      @users = User.filter_by_starts_with(params[:query])
      render json: @users
    end
  end
end
