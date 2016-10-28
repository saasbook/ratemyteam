require 'rack/file'

Given /^I have launched the rating app as "(.*)\/(.*)"$/ do |name,sid|
  # neat hack to allow Capybara to load a static page and interact with it,
  # but we must help it remember the active app and session
  #  https://gist.github.com/jgwhite/4046511
  orig_app = Capybara.app
  Capybara.app = Rack::File.new Rails.root
  visit "/spec/fixtures/launch.html"
  click_button "submit"
  Capybara.app = orig_app
end
