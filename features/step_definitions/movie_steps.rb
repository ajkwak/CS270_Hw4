# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  assert movies_table.hashes.size == Movie.all.count
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # Split rating_list
  rating_list = rating_list.split(/,\s|,/)

  # Iterate through ratings, check those boxes
  rating_list.each do |rating|
    step "I #{uncheck}check \"ratings[#{rating}]\""
  end
end

Then /I should see all of the movies/ do
  # Nothing yet
  rows = page.all('table#movies tr').count - 1 # must subtract 1 so omit table header row
  rows.should == Movie.all.count
end
