require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TripLog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.active_record.default_timezone = :local
    config.time_zone = 'Asia/Tokyo'

    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'model', '*.{rb,yml}').to_s]

    config.generators do |g|
      g.assets false # CSS, JavaScriptファイル生成せず
      g.helper false # ヘルパーを作らない
      g.jbuilder false # JSON をこねくりまわすシンプルなDSL らしい
      g.test_framework false # specは作らない
    end
  end
end
