Feature: Request leave
  In order to start my vacation
  As a worker
  I want to request my leave

  Scenario: Request for leave in the futre
    Given today is 2011-08-01
      And I am logged in
     When I follow "neuer Urlaubsantrag"
      And I fill in "Von" with "2011-08-10"
      And I fill in "Bis" with "2011-08-14"
      And I press "beantragen"
     Then I should see "Urlaub von 5 Tagen beantragt"
      And a leave should exist
