require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "matestack/ui/bootstrap"
Dotenv::Railtie.load

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # config.eager_load_paths += %W( #{config.root}/app/matestack/registry )
  end
end
