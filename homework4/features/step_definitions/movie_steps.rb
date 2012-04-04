Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

When /^I go to the edit page for "(.*)"$/ do |movie|
  m = Movie.find_by_title(movie)
  visit edit_movie_path(m)
end

And /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  fill_in(field, :with => value)
end

And /^I press "(.*)"$/ do |button|
  click_button(button)
end

Then /^the director of "(.*)" should be "(.*)"$/ do |movie, director|
  m = Movie.find_by_title(movie)
  visit movie_path(m)
#  page.body.should match(/.* #{movie}<\/h2>.*/)
  page.body.should match(/Director:\n#{director}/)
end

Given /^I am on the details page for "(.*)"$/ do |movie|
  m = Movie.find_by_title(movie)
  visit movie_path(m)
end

When /^I follow "(.*)"$/ do |link|
  click_link(link)
end


Then /^I should be on the Similar Movies page for "(.*)"$/ do |movie|
  m = Movie.find_by_title(movie)
  visit searchsimilar_url(:id => m.id)
end

And  /^I should see "(.*)"$/ do |movie|
  page.body.should match(/#{movie}/)
end

But  /^I should not see "(.*)"$/ do |movie|
  page.body.should_not match(/#{movie}/)
end
Then /^I should be on the home page$/ do
  visit movies_path
end

And /^I should see '"([^"]*)" has no director info'$/ do |movie|
  page.body.should match(/.*'#{movie}' has no director info.*/)
end

