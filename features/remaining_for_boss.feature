Feature: Remaining time for boss
  In order to always have one worker at hand
  As a boss
  I want to know how much leave time each of my workers has

  Background:
    Given a boss exists
      And a the following workers exist:
        | worker |
        | Peter  |
        | Paul   |
        | Mary   |
      And I am logged in as the boss

  Scenario: no leaves at all
      Then I should see the following worker leaves table:
        |       | Januar | Februar | März | April | Mai | Juni | Juli | August | September | Oktober | November | Dezember | Saldo |
        | Peter |        |         |      |       |     |      |      |        |           |         |          |          | 10    |
        | Paul  |        |         |      |       |     |      |      |        |           |         |          |          | 10    |
        | Mary  |        |         |      |       |     |      |      |        |           |         |          |          | 10    |

  Scenario: three workers took some leave in July, affecting saldo for each worker
     Given the following leaves exist:
        | worker         | first_day  | duration | state |
        | worker "Peter" | 2011-07-01 | 1        | taken |
        | worker "Paul"  | 2011-07-02 | 2        | taken |
        | worker "Mary"  | 2011-07-03 | 4        | taken |
       And I am on my dashboard
      Then I should see the following worker leaves table:
        |       | Januar | Februar | März | April | Mai | Juni | Juli | August | September | Oktober | November | Dezember | Saldo |
        | Peter |        |         |      |       |     | 1    |      |        |           |         |          |          | 9     |
        | Paul  |        |         |      |       |     | 2    |      |        |           |         |          |          | 8     |
        | Mary  |        |         |      |       |     | 4    |      |        |           |         |          |          | 6     |

  Scenario: one worker scheduled one leave per month
     Given the following leaves exist:
        | worker        | first_day  | duration | state     |
        | worker "Mary" | 2011-07-23 | 1        | taken     |
        | worker "Mary" | 2011-08-02 | 4        | taken     |
        | worker "Mary" | 2011-09-02 | 2        | confirmed |
        | worker "Mary" | 2011-10-03 | 1        | requested |
       And I am on my dashboard
      Then I should see the following worker leaves table:
        |       | Januar | Februar | März | April | Mai | Juni | Juli | August | September    | Oktober      | November | Dezember | Saldo |
        | Peter |        |         |      |       |     |      |      |        |              |              |          |          | 10    |
        | Paul  |        |         |      |       |     |      |      |        |              |              |          |          | 10    |
        | Mary  |        |         |      |       |     |      | 1    | 4      | genehmigt: 2 | beantragt: 1 |          |          | 5     |

  Scenario: workers requested and took leaves in the same month
      Given the following leaves exist:
        | worker         | first_day  | duration | state     |
        | worker "Peter" | 2011-08-10 | 1        | requested |
        | worker "Peter" | 2011-08-20 | 2        | confirmed |
        | worker "Paul"  | 2011-08-03 | 4        | taken     |
        | worker "Paul"  | 2011-08-07 | 2        | confirmed |
        | worker "Paul"  | 2011-08-10 | 1        | requested |
        | worker "Mary"  | 2011-08-10 | 2        | taken     |
        | worker "Mary"  | 2011-08-20 | 1        | requested |
       And I am on my dashboard
      Then I should see the following worker leaves table:
        |       | Januar | Februar | März | April | Mai | Juni | Juli | August                      | September | Oktober | November | Dezember | Saldo |
        | Peter |        |         |      |       |     |      |      | beantragt: 1 genehmigt: 2   |           |         |          |          | 10    |
        | Paul  |        |         |      |       |     |      |      | 4 beantragt: 1 genehmigt: 2 |           |         |          |          | 6     |
        | Mary  |        |         |      |       |     |      |      | 2 beantragt: 1              |           |         |          |          | 8     |

  Scenario: worker took leave crossing month borders
