Feature: Request leave
  In order to start my vacation
  As a worker
  I want to request my leave

  Scenario: Request for leave in the future
    Given today is 2011-08-01
      And I am logged in
     When I follow "neuer Urlaubsantrag"
      And I fill in the following:
         | Von       | 2011-08-10 |
         | Bis       | 2011-08-14 |
         | Tage      | 5          |
         | Anmerkung | Camp       |
      And I press "beantragen"
     Then I should see "Urlaub von 5 Tagen beantragt"
      And a leave should exist with comment: "Camp", duration: 5
