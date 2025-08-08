Feature: resource_github_app_installation_repositories
  As a user of the Terraform GitHub Provider
  I want to be able to manage the repositories that a GitHub App is installed on
  So that I can automate the management of my app installations.

  Scenario: Set the repositories for a GitHub App installation
    Given I have a GitHub App installation with the id "12345"
    And I have a repository named "test-repo"
    When I define a `resource_github_app_installation_repositories` with the following attributes:
      | installation_id       | "12345"       |
      | selected_repositories | ["test-repo"] |
    Then the app should be installed on the "test-repo" repository

  Scenario: Update the repositories for a GitHub App installation
    Given I have a GitHub App installation with the id "12345"
    And the app is installed on the "test-repo" repository
    And I have a repository named "another-repo"
    When I update the `resource_github_app_installation_repositories` with the following attributes:
      | selected_repositories | ["test-repo", "another-repo"] |
    Then the app should be installed on the "test-repo" and "another-repo" repositories

  Scenario: Remove a repository from a GitHub App installation
    Given I have a GitHub App installation with the id "12345"
    And the app is installed on the "test-repo" and "another-repo" repositories
    When I update the `resource_github_app_installation_repositories` with the following attributes:
      | selected_repositories | ["test-repo"] |
    Then the app should be installed on the "test-repo" repository
    And the app should not be installed on the "another-repo" repository
