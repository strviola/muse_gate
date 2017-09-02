require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MuseGate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # spec configuration
    config.generators do |g|
      g.test_framework(:rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: true,
        controller_specs: true,
        request_specs: false)
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # use slim template default
    config.generators.template_engine = :slim
  end
end
