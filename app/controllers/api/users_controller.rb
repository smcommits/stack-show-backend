class Api::UsersController < ApplicationController 
  before_action :authenticate_user!

  def update 
    user = current_user
    user.avatar_path = params[:image]
    if user.save!
      render json: user
    end
  end
end


