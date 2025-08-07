Feature: data_source_github_organization_custom_role
  As a user of the Terraform GitHub Provider
  I want to be able to read the information about a GitHub organization custom role
  So that I can use it in my Terraform configuration.

  Scenario: Read information about a GitHub organization custom role
    Given I have a GitHub organization
    And the organization has a custom role named "My Custom Role" with base role "read" and description "My Custom Role Description"
    And the custom role has the permissions "read:org" and "read:repo"
    When I define a `data_source_github_organization_custom_role` resource with the following attributes:
      | name | "My Custom Role" |
    Then the "base_role" attribute should be "read"
    And the "description" attribute should be "My Custom Role Description"
    And the "permissions" attribute should be a set of strings
    And the set of strings should contain "read:org"
    And the set of strings should contain "read:repo"
