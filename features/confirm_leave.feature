Feature: Confirm leave request
  In order to allow my workers to go on vacation
  As a boss
  I want ot confirm their leaves

  Scenario: Confirming a leave
    Given today is 2011-08-01
      And a boss exists
      And a worker exists with boss: the boss
      And a leave request exists with first_day: "2011-08-10", duration: 5, worker: the worker
      And I am logged in as the boss
     When I press "genehmigen"
     Then I should see "Urlaub von 5 Tagen genehmigt"

