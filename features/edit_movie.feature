Feature: search for movies by director

  As a movie buff
  So that I can correct or improve information about a movie
  I want to edit movies in the RottenPotatoes database.

Background: movie to edit is in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |

Scenario: Edit the title of the movie
  When I go to the edit page for "Star Wars"
  And  I fill in "Title" with "Sex, Lies, and Videotape"
  And  I press "Update Movie Info"
  Then I should be on the details page for "Sex, Lies, and Videotape"
  And I should see "Sex, Lies, and Videotape was successfully updated"

Scenario: Edit the director of the movie
  When I go to the edit page for "Star Wars"
  And  I fill in "Director" with "D.J. LeVine"
  And  I press "Update Movie Info"
  Then I should be on the details page for "Star Wars"
  And I should see "Star Wars was successfully updated"
  And I should see "Director: D.J. LeVine"

Scenario: Edit the rating of the movie
  When I go to the edit page for "Star Wars"
  And  I select "G" from "Rating"
  And  I press "Update Movie Info"
  Then I should be on the details page for "Star Wars"
  And I should see "Star Wars was successfully updated"
  And I should see "Rating: G"

Scenario: Edit the release date of the movie
  When I go to the edit page for "Star Wars"
  And  I select "1978" from "movie_release_date_1i"
  And  I select "March" from "movie_release_date_2i"
  And  I select "15" from "movie_release_date_3i"
  And  I press "Update Movie Info"
  Then I should be on the details page for "Star Wars"
  And I should see "Star Wars was successfully updated"
  And I should see "Released on: March 15, 1978"