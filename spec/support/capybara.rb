# frozen_string_literal: true

require 'capybara/rails'
require 'capybara/cuprite'
require 'capybara/rspec'

test_env_number = ENV['TEST_ENV_NUMBER'].to_i

Capybara.server_port = 9887 + test_env_number

Capybara.javascript_driver = :cuprite


Capybara.register_driver(:cuprite) do |app|
  is_headless = true
  is_headless = false if ARGV.present?

  Capybara::Cuprite::Driver.new(app, timeout: 30, headless: is_headless, window_size: [1200, 800], browser_options: {
    'no-sandbox': nil,
    'disable-gpu': nil,
    'disable-dev-shm-usage': nil,
    'disable-infobars': nil,
    'disable-extensions': nil,
    'disable-popup-blocking': nil,
    'window-size': '1280,1024'
  }, port: 9515 + test_env_number)
end

Capybara.server = :puma, { Silent: true }

compile_assets = ->() do
  next if ENV['CI']

  next if Dir.exist?(Rails.root.join('public/assets'))

  Dummy::Application.load_tasks
  Rake::Task['assets:precompile'].invoke
end

RSpec.configure do |config|
  config.before(:each, type: :feature) do |_|
    compile_assets.call
  end
end

