Feature: resource_github_membership
  As a user of the Terraform GitHub Provider
  I want to be able to manage a user's membership in a GitHub organization
  So that I can automate the management of my organization members.

  Scenario: Add a member to an organization
    Given I have a GitHub organization
    And I have a user with the username "test-user"
    When I define a `resource_github_membership` with the following attributes:
      | username | "test-user" |
      | role     | "member"    |
    Then the user "test-user" should be a member of the organization
    And the user should have the role "member"

  Scenario: Update a member's role in an organization
    Given I have a GitHub organization
    And the user "test-user" is a member of the organization with the role "member"
    When I update the `resource_github_membership` with the following attributes:
      | role | "admin" |
    Then the user "test-user" should have the role "admin" in the organization

  Scenario: Remove a member from an organization
    Given I have a GitHub organization
    And the user "test-user" is a member of the organization
    When I delete the `resource_github_membership` for the user "test-user"
    Then the user "test-user" should be removed from the organization

  Scenario: Downgrade a member's role on destroy
    Given I have a GitHub organization
    And the user "test-user" is a member of the organization with the role "admin"
    When I delete the `resource_github_membership` for the user "test-user" with the attribute "downgrade_on_destroy" set to true
    Then the user "test-user" should have the role "member" in the organization
