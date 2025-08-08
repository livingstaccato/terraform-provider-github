Feature: resource_github_organization_custom_role
  As a user of the Terraform GitHub Provider
  I want to be able to manage a custom role in a GitHub organization
  So that I can automate the management of my roles.

  Scenario: Create a custom role
    Given I have a GitHub organization
    When I define a `resource_github_organization_custom_role` with the following attributes:
      | name        | "My Custom Role" |
      | base_role   | "read"           |
      | permissions | ["read:org", "read:repo"] |
      | description | "My Custom Role Description" |
    Then a custom role named "My Custom Role" should be created in the organization
    And the role should have the base role "read"
    And the role should have the permissions "read:org" and "read:repo"
    And the role should have the description "My Custom Role Description"

  Scenario: Update a custom role
    Given I have a GitHub organization
    And the organization has a custom role named "My Custom Role"
    When I update the `resource_github_organization_custom_role` with the following attributes:
      | description | "My New Custom Role Description" |
    Then the custom role should be updated
    And the role should have the description "My New Custom Role Description"

  Scenario: Delete a custom role
    Given I have a GitHub organization
    And the organization has a custom role named "My Custom Role"
    When I delete the `resource_github_organization_custom_role` with the name "My Custom Role"
    Then the custom role "My Custom Role" should be deleted from the organization
