Feature: resource_github_repository_collaborator
  As a user of the Terraform GitHub Provider
  I want to be able to manage a collaborator on a GitHub repository
  So that I can automate the management of my collaborators.

  Scenario: Add a collaborator to a repository
    Given I have a GitHub repository named "test-repo"
    And I have a user with the username "test-user"
    When I define a `resource_github_repository_collaborator` with the following attributes:
      | repository | "test-repo" |
      | username   | "test-user" |
      | permission | "push"      |
    Then the user "test-user" should be a collaborator on the "test-repo" repository
    And the user should have the permission "push"

  Scenario: Remove a collaborator from a repository
    Given I have a GitHub repository named "test-repo"
    And the user "test-user" is a collaborator on the repository
    When I delete the `resource_github_repository_collaborator` for the user "test-user"
    Then the user "test-user" should not be a collaborator on the "test-repo" repository
