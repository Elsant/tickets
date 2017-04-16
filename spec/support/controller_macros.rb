module ControllerMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end
  def login_admin_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      admin_user = FactoryGirl.create(:user, :admin)
      sign_in admin_user
    end
  end
end