# PER-8195 — RSpec helpers: Capybara + selenium_headless + WEBrick file server.

require 'capybara/rspec'
require 'percy/capybara'
require 'webrick'
require 'rack'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.expect_with(:rspec) { |e| e.include_chain_clauses_in_custom_matcher_descriptions = true }
  config.mock_with(:rspec) { |m| m.verify_partial_doubles = true }
  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand config.seed

  Capybara.default_driver = :selenium_headless
  Capybara.javascript_driver = :selenium_headless

  Capybara.server_port = ENV.fetch('PORT_NUMBER', '3004').to_i
  Capybara.server = :webrick
  Capybara.app = Rack::Files.new(File.expand_path('../..', __dir__))
end
