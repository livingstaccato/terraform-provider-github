Feature: resource_github_app_installation_repository
  As a user of the Terraform GitHub Provider
  I want to be able to manage a single repository that a GitHub App is installed on
  So that I can automate the management of my app installations.

  Scenario: Add a repository to a GitHub App installation
    Given I have a GitHub App installation with the id "12345"
    And I have a repository named "test-repo"
    When I define a `resource_github_app_installation_repository` with the following attributes:
      | installation_id | "12345"     |
      | repository      | "test-repo" |
    Then the app should be installed on the "test-repo" repository

  Scenario: Remove a repository from a GitHub App installation
    Given I have a GitHub App installation with the id "12345"
    And the app is installed on the "test-repo" repository
    When I delete the `resource_github_app_installation_repository` with the repository "test-repo"
    Then the app should not be installed on the "test-repo" repository
