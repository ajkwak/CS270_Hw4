Feature: view details about a movie

  As a movie buff
  So that I can see all the information about a particular movie
  I want to view all of a movie's details on a single page

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |

Scenario: All movie information appears correctly
  Given I am on the details page for "Star Wars"
  Then I should see "Details about Star Wars"
  And I should see "Director: George Lucas"
  And I should see "Rating: PG"
  And I should see "Released on: May 25, 1977"