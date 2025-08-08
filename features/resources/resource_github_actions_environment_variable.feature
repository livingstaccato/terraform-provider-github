Feature: resource_github_actions_environment_variable
  As a user of the Terraform GitHub Provider
  I want to be able to manage an actions environment variable
  So that I can automate the management of my variables.

  Scenario: Create an actions environment variable
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I define a `resource_github_actions_environment_variable` with the following attributes:
      | repository    | "test-repo"   |
      | environment   | "production"  |
      | variable_name | "MY_VARIABLE" |
      | value         | "my-value"    |
    Then the variable "MY_VARIABLE" should be created in the "production" environment of the "test-repo" repository
    And the variable should have the value "my-value"

  Scenario: Update an actions environment variable
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    And the environment has a variable named "MY_VARIABLE" with the value "my-value"
    When I update the `resource_github_actions_environment_variable` with the following attributes:
      | value | "my-new-value" |
    Then the variable "MY_VARIABLE" should be updated in the "production" environment of the "test-repo" repository
    And the variable should have the value "my-new-value"

  Scenario: Delete an actions environment variable
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    And the environment has a variable named "MY_VARIABLE"
    When I delete the `resource_github_actions_environment_variable` with the variable name "MY_VARIABLE"
    Then the variable "MY_VARIABLE" should be deleted from the "production" environment of the "test-repo" repository
