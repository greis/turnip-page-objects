# Page Objects pattern with Turnip

The Page Objects pattern helps you to organize your steps by page.
See more information about it here: http://code.google.com/p/selenium/wiki/PageObjects

With Turnip you can enable your steps by context. And here is an example:

``` ruby
Given I am on the home page
When I search for turnip
Then I should be on the search result page
And I should see the following result:
| title                    | url                                |
| Turnip - Wikipedia       | en.wikipedia.org/wiki/Turnip       |
| jnicklas/turnip - GitHub | https://github.com/jnicklas/turnip |
```


* The step "I am on the :page_name page" is a global step that enables steps for @home_page and tries to call the method 'visit_home_page' that should be implemented within 'steps_for :home_page'.
* The next step is 'I search for :keyword'. This step was enabled by the previous step and is within the 'home_page' scope.
* Then it calls the step 'I should be on the :page_name page'. This step disables the steps from the previous page and enables the steps for the next page. It also tries to call the method 'valid_search_result_page?' if it is present, to validate if we are in the right page.
* The last step is 'I should see the following result:' that is available in the 'search_result_page' scope.
