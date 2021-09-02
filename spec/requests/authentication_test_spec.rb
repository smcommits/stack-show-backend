# spec/requests/authentication_test_spec.rb

require 'rails_helper'
include ActionController::RespondWith

describe 'Authentication', type: :request do
  before(:each) do
    @current_user = create(:user, password: '1234678')
    @client = 'abcd1dMVlvW2BT67xIAS_A'
  end

  context 'sign up' do
    let(:registration_params) do
      {
        name: 'testname',
        email: @current_user.email,
        password: '1234678',
        confirm_password: '1234678'
      }
    end

    it 'returns an error if the email already exists' do
      post user_registration_path, params: registration_params
      expect(JSON.parse(response.body)['errors']['full_messages']).to eq(['Email has already been taken'])
    end

    it 'fails if password is less than six characters' do
      registration_params['password'] = '1234'
      post user_registration_path, params: registration_params
      expect(JSON.parse(response.body)['errors']['password']).to eq(['is too short (minimum is 6 characters)'])
    end

    it 'returns auth_headers on successful sign_up' do 
      registration_params['email'] = 'test@example.com'
      registration_params['password'] = '1234678'
      post user_registration_path, params: registration_params
      auth_info = auth_params_headers(response)
      auth_headers = %w[access-token client expiry token-type uid]
      auth_headers.each do |header|
        expect(auth_info.include?(header)).to eq(true)
      end
    end
  end

  context 'general authentication via API, ' do
    it "doesn't return anything until the user is not authorized" do
      get auth_validate_token_path
      expect(response.status).to eq(401)
    end

    it 'returns the auth_info in header if signed in successfully' do
      login
      auth_info = auth_params_headers(response)
      auth_headers = %w[access-token client expiry token-type uid]
      auth_headers.each do |header|
        expect(auth_info.include?(header)).to eq(true)
      end
    end
  end

  def login
    post new_user_session_path, params: { email: @current_user.email, password: '1234678' }
  end

  def auth_params_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    {
      'access-token' => token,
      'client' => client,
      'uid' => uid,
      'expiry' => expiry,
      'token-type' => token_type
    }
  end
end
