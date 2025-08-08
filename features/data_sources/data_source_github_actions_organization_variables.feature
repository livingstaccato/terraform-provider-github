Feature: data_source_github_actions_organization_variables
  As a user of the Terraform GitHub Provider
  I want to be able to read the variables for a GitHub organization
  So that I can use them in my Terraform configuration.

  Scenario: Read variables for a GitHub organization
    Given I have a GitHub organization
    And the organization has a variable named "MY_VARIABLE" with value "my-value" and visibility "private"
    When I define a `data_source_github_actions_organization_variables` resource
    Then the "variables" attribute should be a list of variables
    And the list of variables should contain a variable with the following attributes:
      | name       | "MY_VARIABLE" |
      | value      | "my-value"    |
      | visibility | "private"     |
      | created_at | (a string)    |
      | updated_at | (a string)    |
