Feature: resource_github_actions_organization_variable
  As a user of the Terraform GitHub Provider
  I want to be able to manage an actions organization variable
  So that I can automate the management of my variables.

  Scenario: Create an actions organization variable
    Given I have a GitHub organization
    When I define a `resource_github_actions_organization_variable` with the following attributes:
      | variable_name | "MY_VARIABLE" |
      | value         | "my-value"    |
      | visibility    | "all"         |
    Then the variable "MY_VARIABLE" should be created for the organization
    And the variable should have the value "my-value"
    And the variable should have the visibility "all"

  Scenario: Update an actions organization variable
    Given I have a GitHub organization
    And the organization has a variable named "MY_VARIABLE" with the value "my-value" and visibility "all"
    When I update the `resource_github_actions_organization_variable` with the following attributes:
      | value | "my-new-value" |
    Then the variable "MY_VARIABLE" should be updated for the organization
    And the variable should have the value "my-new-value"

  Scenario: Create an actions organization variable with selected repositories
    Given I have a GitHub organization
    And the organization has a repository with the id 12345
    When I define a `resource_github_actions_organization_variable` with the following attributes:
      | variable_name           | "MY_VARIABLE" |
      | value                   | "my-value"    |
      | visibility              | "selected"    |
      | selected_repository_ids | [12345]       |
    Then the variable "MY_VARIABLE" should be created for the organization
    And the variable should have the value "my-value"
    And the variable should have the visibility "selected"
    And the variable should be accessible by the repository with id 12345

  Scenario: Delete an actions organization variable
    Given I have a GitHub organization
    And the organization has a variable named "MY_VARIABLE"
    When I delete the `resource_github_actions_organization_variable` with the variable name "MY_VARIABLE"
    Then the variable "MY_VARIABLE" should be deleted from the organization
