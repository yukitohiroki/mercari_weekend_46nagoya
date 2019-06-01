require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MercariWeekend46nagoya
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.generators do |g|
      g.test_framework  nil
      g.assets  false
      g.helper false
      g.stylesheets false
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        controller_specs: false,
        routing_specs: false
    end

    config.i18n.default_locale = :ja

    config.time_zone = 'Tokyo'

    config.assets.precompile += %w( *.eot *.woff *.ttf *.svg *.otf *.png *.jpg *.jpeg *.gif vendor.css vendor.js )

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      %Q(#{html_tag}).html_safe
    end
  end
end