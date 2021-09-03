require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  before(:each) do
    @current_user = create(:user)
    login
  end

  context 'with authentication' do
    describe 'PUT update' do
      it 'should update the image path for the user' do
        put :update, params: { image: 'new_image_path', id: @current_user.id }
        updated_user = User.find(@current_user.id)
        expect(updated_user.image).to eq('new_image_path')
      end
    end
  end

  def login
    request.headers.merge!(@current_user.create_new_auth_token) if sign_in(@current_user)
  end
end
