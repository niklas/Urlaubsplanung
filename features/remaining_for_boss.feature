Feature: Remaining time for boss
  In order to always have one worker at hand
  As a boss
  I want to know how much leave time each of my workers has

  Scenario: overview over all workers
    Given a boss exists
      And a the following workers exist:
        | worker |
        | Peter  |
        | Paul   |
        | Mary   |
      And the following leave requests exist:
        | worker         | from       | until      |
        | worker "Peter" | 2011-08-10 | 2011-08-14 |
      And the following confirmed leaves exist:
        | worker        | from       | until      |
        | worker "Paul" | 2011-08-10 | 2011-08-16 |
      And I am logged in as the boss
     Then I should see a list of the following workers:
       | name  | remaining |
       | Peter | 10        |
       | Paul  | 5         |
       | Mary  | 10        |
