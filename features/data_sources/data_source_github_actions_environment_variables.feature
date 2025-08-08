Feature: data_source_github_actions_environment_variables
  As a user of the Terraform GitHub Provider
  I want to be able to read the variables for a GitHub Actions environment
  So that I can use them in my Terraform configuration.

  Scenario: Read variables for a GitHub Actions environment using full_name
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has an environment named "production"
    And the "production" environment has a variable named "MY_VARIABLE" with the value "my-value"
    When I define a `data_source_github_actions_environment_variables` resource with the following attributes:
      | full_name   | "my-org/test-repo" |
      | environment | "production"       |
    Then the "variables" attribute should be a list of variables
    And the list of variables should contain a variable with the following attributes:
      | name       | "MY_VARIABLE" |
      | value      | "my-value"    |
      | created_at | (a string)    |
      | updated_at | (a string)    |

  Scenario: Read variables for a GitHub Actions environment using name
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    And the "production" environment has a variable named "MY_VARIABLE" with the value "my-value"
    When I define a `data_source_github_actions_environment_variables` resource with the following attributes:
      | name        | "test-repo"  |
      | environment | "production" |
    Then the "variables" attribute should be a list of variables
    And the list of variables should contain a variable with the following attributes:
      | name       | "MY_VARIABLE" |
      | value      | "my-value"    |
      | created_at | (a string)    |
      | updated_at | (a string)    |
