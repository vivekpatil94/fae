def super_admin_login
  role = FactoryGirl.create(:fae_role, name: 'super admin')
  user = FactoryGirl.create(:fae_user, first_name: 'SuperAdmin', role: role)

  login(user)
end

def super_admin_login
  role = FactoryGirl.create(:fae_role, name: 'admin')
  user = FactoryGirl.create(:fae_user, first_name: 'Admin', role: role)

  login(user)
end

def super_admin_login
  role = FactoryGirl.create(:fae_role, name: 'user')
  user = FactoryGirl.create(:fae_user, first_name: 'User', role: role)

  login(user)
end

module SignInControllerHelper
  def login(user)
    sign_in user
  end
end

module SignInRequestHelper
  def login(user)
    post_via_redirect fae.user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include SignInControllerHelper, type: :controller
  config.include SignInRequestHelper, type: :request
end