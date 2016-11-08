Feature: rate team

  As a CS169 student
  So that I can get credit for team evaluation
  I want to enter ratings for my team mates

Background: existing course and iteration

  Given today is "1/4/2016"
  And   course ID "1451720" has "iter1" from "1/1/2016" to "1/8/2016"
  And   I have launched the rating app as "Junyu Wang/24153759"
  Then show me the page
  Then  I should see "Welcome, Junyu Wang" within "#welcome"
  And   I should see "Evaluate your teammates' performance for iter1" within "#explain"

Scenario: create rating for my teammates

  When I rate my teammates as follows:
  | name         | sis_user_id | rating | comment        |
  | Yibing Chen  |    24435363 |      2 |                |
  | Jiacheng Wu  |    24302790 |      1 | Didn't show up |
  | Shuotong Wu  |    24596399 |      3 |                |
  | Jiawei Jiang |    24602191 |      5 | Rock star!     |

Scenario: I can rate other team members but not myself

  Then I should be on the rating screen
  And I should be able to rate the following people: Yibing Chen, Jiacheng Wu, Shuotong Wu, Jiawei Jiang
  But I should not be able to rate the following people: Junyu Wang

