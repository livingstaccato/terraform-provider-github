Feature: data_source_github_organization_teams
  As a user of the Terraform GitHub Provider
  I want to be able to read the teams for a GitHub organization
  So that I can use them in my Terraform configuration.

  Scenario: Read teams for a GitHub organization
    Given I have a GitHub organization
    And the organization has a team named "My Team" with slug "my-team" and privacy "closed"
    And the team has the member "test-user"
    And the team has the repository "test-repo"
    When I define a `data_source_github_organization_teams` resource
    Then the "teams" attribute should be a list of teams
    And the list of teams should contain a team with the following attributes:
      | name    | "My Team"  |
      | slug    | "my-team"  |
      | privacy | "closed"   |
    And the team's "members" attribute should contain "test-user"
    And the team's "repositories" attribute should contain "test-repo"
