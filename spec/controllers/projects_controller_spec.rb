require 'rails_helper'

RSpec.describe Api::ProjectsController, type: :controller do
  before(:each) do
    @current_user = create(:user)
    @project = create(:project, user_id: @current_user.id)
    @project1 = create(:project, user_id: @current_user.id)
    login
  end

  context 'with authentication' do
    describe 'GET index' do
      it 'should get all the projects' do
        get :index
        expect(assigns(:projects)).to eq([@project, @project1])
      end
    end

    describe 'POST create' do
      it 'should create a new project' do
        post :create, params: { title: 'Project Title', image_path: 'testImage', description: 'Test Description' }
        expect(response).to be_successful
        expect(Project.last.title).to eq('Project Title')
        expect(Project.last.description).to eq('Test Description')
      end
    end

    describe 'GET show' do
      it 'should return a single project based on the id' do
        get :show, params: { id: @project.id }
        expect(JSON.parse(response.body)['title']).to eq(@project.title)
        expect(JSON.parse(response.body)['description']).to eq(@project.description)
      end
    end
  end

  def login
    request.headers.merge!(@current_user.create_new_auth_token) if sign_in(@current_user)
  end
end
