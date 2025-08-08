Feature: resource_github_organization_security_manager
  As a user of the Terraform GitHub Provider
  I want to be able to manage the security manager role for a team in a GitHub organization
  So that I can automate the management of my security settings.

  Scenario: Assign the security manager role to a team
    Given I have a GitHub organization
    And the organization has a team with the slug "my-team"
    When I define a `resource_github_organization_security_manager` with the following attributes:
      | team_slug | "my-team" |
    Then the team "my-team" should have the security manager role

  Scenario: Remove the security manager role from a team
    Given I have a GitHub organization
    And the team "my-team" has the security manager role
    When I delete the `resource_github_organization_security_manager` for the team "my-team"
    Then the team "my-team" should not have the security manager role
