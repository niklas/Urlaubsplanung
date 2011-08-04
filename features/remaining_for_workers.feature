Feature: Remaining time for workers
  In order to plan my vacation time exactly
  As a worker beginning to work in August
  I want to know how much leave time I have left this year

  Background:
    Given a worker exists with started_on: 2011-08-01
      And I am logged in as the worker

  Scenario: No vacation taken
     Then I should see "10" within remaining days

  Scenario: 3 days vacation requested, but not confirmed
    Given a leave request exists with worker: the worker, from: 2011-08-10, until: 2011-08-14
      And I am on my dashboard
     Then I should see "10" within remaining days

  Scenario: 3 days vacation requested and confirmed
    Given a confirmed leave exists with worker: the worker, from: 2011-08-10, until: 2011-08-14
      And I am on my dashboard
     Then I should see "5" within remaining days

