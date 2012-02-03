Feature: User searches on the home page

  Scenario:
    Given the following documents:
      | title                    | url                                | content                                 |
      | Turnip - Wikipedia       | en.wikipedia.org/wiki/Turnip       | The turnip is a root vegetable          |
      | jnicklas/turnip - GitHub | https://github.com/jnicklas/turnip | Turnip is a Gherkin extension for RSpec |
    And I am on the home page
    When I search for turnip
    Then I should be on the "search result" page
    And I should see the following results:
      | title                    | url                                |
      | Turnip - Wikipedia       | en.wikipedia.org/wiki/Turnip       |
      | jnicklas/turnip - GitHub | https://github.com/jnicklas/turnip |

