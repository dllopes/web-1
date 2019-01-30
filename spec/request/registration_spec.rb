require "rails_helper"

describe "devise#registration as a provider", :type => :request do

  it "redirects to oauth#callback" do
    get '/users/auth/facebook'
    expect(response).to redirect_to(user_facebook_omniauth_callback_path)
  end

end