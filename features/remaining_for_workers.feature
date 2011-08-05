Feature: Remaining time for workers
  In order to plan my vacation time exactly
  As a worker beginning to work in August
  I want to know how much leave time I have left this year

  Background:
    Given a worker exists with started_on: 2011-08-01
      And today is 2011-08-02
      And I am logged in as the worker

  Scenario: No vacation taken
     Then I should see "10" within remaining days
      And I should see the following leaves table:
        |           | beantragt | genehmigt | genommen |
        | Januar    |           |           |          |
        | Februar   |           |           |          |
        | März      |           |           |          |
        | April     |           |           |          |
        | Mai       |           |           |          |
        | Juni      |           |           |          |
        | Juli      |           |           |          |
        | August    |           |           |          |
        | September |           |           |          |
        | Oktober   |           |           |          |
        | November  |           |           |          |
        | Dezember  |           |           |          |
        | Saldo     | 10        | 10        | 10       |

  Scenario: 5 days vacation requested, but not confirmed
    Given a leave request exists with worker: the worker, first_day: "2011-08-10", duration: 5
      And I am on my dashboard
     Then I should see "10" within remaining days
      And I should see the following leaves table:
        |           | beantragt | genehmigt | genommen |
        | Januar    |           |           |          |
        | Februar   |           |           |          |
        | März      |           |           |          |
        | April     |           |           |          |
        | Mai       |           |           |          |
        | Juni      |           |           |          |
        | Juli      |           |           |          |
        | August    | 5         |           |          |
        | September |           |           |          |
        | Oktober   |           |           |          |
        | November  |           |           |          |
        | Dezember  |           |           |          |
        | Saldo     | 5         | 10        | 10       |

  Scenario: 5 days vacation requested and confirmed
    Given a confirmed leave exists with worker: the worker, first_day: "2011-08-10", duration: 5
      And I am on my dashboard
     Then I should see "10" within remaining days
      And I should see the following leaves table:
        |           | beantragt | genehmigt | genommen |
        | Januar    |           |           |          |
        | Februar   |           |           |          |
        | März      |           |           |          |
        | April     |           |           |          |
        | Mai       |           |           |          |
        | Juni      |           |           |          |
        | Juli      |           |           |          |
        | August    | 5         | 5         |          |
        | September |           |           |          |
        | Oktober   |           |           |          |
        | November  |           |           |          |
        | Dezember  |           |           |          |
        | Saldo     | 5         | 5         | 10       |

  Scenario: 5 days vacation requested, confirmed and taken
    Given a taken leave exists with worker: the worker, first_day: "2011-08-10", duration: 5
      And I am on my dashboard
     Then I should see "5" within remaining days
      And I should see the following leaves table:
        |           | beantragt | genehmigt | genommen |
        | Januar    |           |           |          |
        | Februar   |           |           |          |
        | März      |           |           |          |
        | April     |           |           |          |
        | Mai       |           |           |          |
        | Juni      |           |           |          |
        | Juli      |           |           |          |
        | August    | 5         | 5         | 5        |
        | September |           |           |          |
        | Oktober   |           |           |          |
        | November  |           |           |          |
        | Dezember  |           |           |          |
        | Saldo     | 5         | 5         | 5        |
