require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
Capybara.default_driver = :webkit
Capybara.app_host = 'http://onliner.by/login'
module MyModule
  include Capybara::DSL
  def login!
    within(:xpath, ".//form[@id='session']") do
      fill_in 'Email', with: 'fedor.benenson@tut.by'
      fill_in 'Password', with: 'redled1991'
    end
    click_button 'Sign in'
Capybara::Screenshot.autosave_on_failure = false
Capybara::Screenshot.screenshot_and_save_page
Capybara::Screenshot.screenshot_and_open_image
  end
end
