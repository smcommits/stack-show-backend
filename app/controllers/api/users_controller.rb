class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    user = current_user
    user.avatar_path = params[:image]
    render json: user if user.save!
  end
end
