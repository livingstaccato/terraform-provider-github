Feature: resource_github_team_repository
  As a user of the Terraform GitHub Provider
  I want to be able to manage a team's access to a repository
  So that I can automate the management of my teams.

  Scenario: Add a team to a repository
    Given I have a team with the id "TEAM_ID"
    And I have a repository named "test-repo"
    When I define a `resource_github_team_repository` with the following attributes:
      | team_id    | "TEAM_ID"   |
      | repository | "test-repo" |
      | permission | "push"      |
    Then the team "TEAM_ID" should have "push" access to the "test-repo" repository

  Scenario: Update a team's permission on a repository
    Given I have a team with the id "TEAM_ID"
    And the team has "push" access to the "test-repo" repository
    When I update the `resource_github_team_repository` with the following attributes:
      | permission | "admin" |
    Then the team "TEAM_ID" should have "admin" access to the "test-repo" repository

  Scenario: Remove a team from a repository
    Given I have a team with the id "TEAM_ID"
    And the team has access to the "test-repo" repository
    When I delete the `resource_github_team_repository` for the team "TEAM_ID" and repository "test-repo"
    Then the team "TEAM_ID" should not have access to the "test-repo" repository
