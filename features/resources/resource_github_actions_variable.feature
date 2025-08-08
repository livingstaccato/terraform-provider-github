Feature: resource_github_actions_variable
  As a user of the Terraform GitHub Provider
  I want to be able to manage an actions variable in a repository
  So that I can automate the management of my variables.

  Scenario: Create an actions variable
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_actions_variable` with the following attributes:
      | repository    | "test-repo"   |
      | variable_name | "MY_VARIABLE" |
      | value         | "my-value"    |
    Then the variable "MY_VARIABLE" should be created in the "test-repo" repository
    And the variable should have the value "my-value"

  Scenario: Update an actions variable
    Given I have a GitHub repository named "test-repo"
    And the repository has a variable named "MY_VARIABLE" with the value "my-value"
    When I update the `resource_github_actions_variable` with the following attributes:
      | value | "my-new-value" |
    Then the variable "MY_VARIABLE" should be updated in the "test-repo" repository
    And the variable should have the value "my-new-value"

  Scenario: Delete an actions variable
    Given I have a GitHub repository named "test-repo"
    And the repository has a variable named "MY_VARIABLE"
    When I delete the `resource_github_actions_variable` with the variable name "MY_VARIABLE"
    Then the variable "MY_VARIABLE" should be deleted from the "test-repo" repository
