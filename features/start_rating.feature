Feature: rate team

  As a CS169 student
  So that I can get credit for team evaluation
  I want to enter ratings for my team mates

Background: rating app launched

  Given I have launched the rating app as "Junyu Wang/24153759"
  And my team includes these people:
  | name         | sis_user_id |
  | Yibing Chen  |    24435363 |
  | Jiacheng Wu  |    24302790 |
  | Shuotong Wu  |    24596399 |
  | Jiawei Jiang |    24602191 |

Scenario: I can rate other team members but not myself

  Then I should be on the rating screen
  And I should be able to rate the following people: Yibing Chen, Jiacheng Wu, Shuotong Wu, Jiawei Jiang
  But I should not be able to rate the following people: Junyu Wang

