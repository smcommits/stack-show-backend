require 'rails_helper'

RSpec.describe Api::SearchController, type: :controller do
  before(:each) do
    @current_user = create(:user)
    @project = create(:project, title: 'Test Title', user_id: @current_user.id)
    @project2 = create(:project, title: 'nothing', user_id: @current_user.id)
    login
  end

  context 'with authentication' do
    describe 'GET projects' do
      it 'returns the projects that match the search query' do
        get :projects, params: { query: 't' }
        expect(JSON.parse(response.body)[0]['id']).to eq(@project.id)
      end

      it "should not return projects that don't match the name" do
        get :projects, params: { query: 't' }
        collection = JSON.parse(response.body)
        instance_exists = collection.any? { |item| item['id'] == @project2.id }
        expect(instance_exists).to eq(false)
      end
    end
  end

  def login
    request.headers.merge!(@current_user.create_new_auth_token) if sign_in(@current_user)
  end
end
