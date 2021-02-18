require 'rails_helper'
require 'support/factory_bot'

RSpec.describe 'UserProfilesController', type: :request do
  describe 'GET sugn_up' do
    it 'user.set_user' do
      get '/users/sign_up'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET sign_in' do
    it 'user.set_user' do
      get '/users/sign_in'
      expect(response).to have_http_status(:success)
    end
  end
end
