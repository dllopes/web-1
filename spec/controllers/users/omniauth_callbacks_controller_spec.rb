require 'rails_helper'

describe Users::OmniauthCallbacksController, type: :controller do

  before(:each) do
    facebook_hash
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
  end

  after(:each) do
    OmniAuth.config.mock_auth[:facebook] = nil
  end

  describe 'GET #callback' do
    it 'expects omniauth.auth to be be_truthy' do
      get :facebook
      expect(request.env['omniauth.auth']).to be_truthy
    end

    it 'completes the registration process successfully' do
      get :facebook
      expect(subject).to redirect_to root_path
    end

    it 'creates an oauth_account record' do
      expect{
        get :facebook
      }.to change { User.count }.by(1)
    end

  end

end