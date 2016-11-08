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

Then /^I should be able to rate/ do |table|
  table.hashes.each do |teammate|
    sis_id,name = teammate.values_at('sis_user_id', 'name')
  end
end

# Checking the page

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Then /^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  with_scope(selector) do
    expect(page).to have_content(text)
  end
end

Then /^show me the page$/ do
  save_and_open_page
end
