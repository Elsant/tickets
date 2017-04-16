RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Features::SessionHelpers, type: :feature
  config.include Features::SessionHelpers, type: :request
end
