Feature: resource_github_repository_collaborators
  As a user of the Terraform GitHub Provider
  I want to be able to manage all collaborators on a GitHub repository
  So that I can automate the management of my collaborators.

  Scenario: Set the collaborators for a repository
    Given I have a GitHub repository named "test-repo"
    And I have a user with the username "test-user"
    And I have a team with the slug "my-team"
    When I define a `resource_github_repository_collaborators` with the following attributes:
      | repository | "test-repo" |
    And a "user" block with the following attributes:
      | username   | "test-user" |
      | permission | "push"      |
    And a "team" block with the following attributes:
      | team_id    | "my-team" |
      | permission | "pull"    |
    Then the user "test-user" should be a collaborator on the "test-repo" repository with "push" permission
    And the team "my-team" should be a collaborator on the "test-repo" repository with "pull" permission

  Scenario: Update the collaborators for a repository
    Given I have a GitHub repository named "test-repo"
    And the user "test-user" is a collaborator on the repository with "push" permission
    When I update the `resource_github_repository_collaborators` to only have a "user" block with the following attributes:
      | username   | "test-user" |
      | permission | "admin"     |
    Then the user "test-user" should have the permission "admin"

  Scenario: Delete the collaborators for a repository
    Given I have a GitHub repository named "test-repo"
    And the user "test-user" is a collaborator on the repository
    When I delete the `resource_github_repository_collaborators`
    Then the user "test-user" should not be a collaborator on the "test-repo" repository

  Scenario: Ignore a team when managing collaborators
    Given I have a GitHub repository named "test-repo"
    And the repository has a team with the slug "my-team"
    When I define a `resource_github_repository_collaborators` with the following attributes:
      | repository | "test-repo" |
    And an "ignore_team" block with the following attributes:
      | team_id | "my-team" |
    Then the team "my-team" should be ignored when managing collaborators
