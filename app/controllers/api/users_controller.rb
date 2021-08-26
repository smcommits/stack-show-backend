# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def update
      user = current_user
      user.image = params[:image]
      render json: user if user.save!
    end
  end
end
