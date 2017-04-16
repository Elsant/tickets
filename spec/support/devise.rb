RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  # config.include Devise::Test::ControllerHelpers, type: :controller
  # config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Features::SessionHelpers, type: :feature
  config.include Features::SessionHelpers, type: :request
end
