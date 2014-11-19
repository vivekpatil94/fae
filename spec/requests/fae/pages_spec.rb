require 'rails_helper'

describe 'pages#home' do

  context 'when user is logged out' do
    it 'should redirect to the login page' do
      get fae_path

      expect(response.status).to eq(302)
      expect(response).to redirect_to(fae.new_user_session_path)
    end
  end

  context 'when user is logged in' do
    it 'should render found' do
      super_admin_login
      get fae_path

      expect(response.status).to eq(200)
    end
  end

end