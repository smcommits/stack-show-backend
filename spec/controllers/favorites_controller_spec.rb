require 'rails_helper'
include ActionController::RespondWith

RSpec.describe Api::FavoritesController, type: :controller do
  before(:each) do
    @current_user = create(:user)
    @project = create(:project, user_id: @current_user.id)
    login
  end

  context 'with authentication' do
    describe 'POST create' do
      it 'should favorite a project' do
        expect do
          post :create, params: { params: { project_id: @project.id } }
        end.to change(Favorite, :count).by(+1)
      end
    end

    describe 'POST destroy' do
      it 'should destroy the favorite project instance' do
        post :create, params: { params: { project_id: @project.id } }
        expect do
          delete :destroy, params: { id: Favorite.all.first.id }
        end.to change(Favorite, :count).by(-1)
      end
    end
  end

  def login
    request.headers.merge!(@current_user.create_new_auth_token) if sign_in(@current_user)
  end
end
