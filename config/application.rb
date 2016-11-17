require_relative "boot"

#require "rails/all"
# This is not loaded in rails/all but inside active_record so add it if you want your models work as expected
require "active_model/railtie"
# And now the rest
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "active_job/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BallersWeb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators.assets = false
    config.generators.helper = false

    #config.active_record.raise_in_transactional_callbacks = true
    Mongoid.load!("./config/mongoid.yml")
    config.generators { |g| g.orm :mongoid }
  end
end
