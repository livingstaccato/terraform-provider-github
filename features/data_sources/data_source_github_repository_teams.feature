Feature: data_source_github_repository_teams
  As a user of the Terraform GitHub Provider
  I want to be able to read the teams for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read teams for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has a team with the name "My Team", slug "my-team", and permission "push"
    When I define a `data_source_github_repository_teams` resource with the following attributes:
      | name | "test-repo" |
    Then the "teams" attribute should be a list of teams
    And the list of teams should contain a team with the following attributes:
      | name       | "My Team" |
      | slug       | "my-team" |
      | permission | "push"    |
