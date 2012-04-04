# Add a declarative step here for populating the DB with movies.

Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
# each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  Movie.create!(movie)
  end
#assert false, "Unimplmemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  regex = Regexp.new ".*#{e1}.*#{e2}"
  name1 = e1.
  page.body.should =~ regex
#assert false, "Unimplmemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

Given /I should see the movies of rating 'PG' or 'R'/ do
  check('ratings_PG')
  check('ratings_R')
end

Given /I should not see the movies of rating 'NC-17' or 'G' or 'PG-13'/ do
  uncheck('ratings_NC-17')
  uncheck('ratings_G')
  uncheck('ratings_PG-13')
end

When /I click on submit/ do
  click_button('ratings_submit')
end

Then /I should see only 'PG' or 'R' rated movies/ do
 page.body.should match(/.*<td>R<\/td>.*/)
 page.body.should match(/.*<td>PG<\/td>.*/)
end

Then /I should not see 'PG-13' and 'NC-17' and 'G' rated movies/ do
  page.body.should_not match(/.*<td>PG-13<\/td>.*/)
  page.body.should_not match(/.*<td>NC-17<\/td>.*/)
  page.body.should_not match(/.*<td>G<\/td>.*/)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(' ');
  ratings.each do |r|
    if (uncheck == true)
      uncheck(r)
    else
      check(r)
    end
  end
end

Then /I should see all of the movies/ do
  table_rows = page.body.scan(/<tr>/).length
  db_rows = Movie.find(:all).length
  table_rows == db_rows
end

Then /I should see an empty table/ do
  table_rows = page.body.scan(/<tr>/).length
  table_rows == 0
end

