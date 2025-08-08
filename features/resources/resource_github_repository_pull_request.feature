Feature: resource_github_repository_pull_request
  As a user of the Terraform GitHub Provider
  I want to be able to manage a pull request
  So that I can automate the management of my pull requests.

  Scenario: Create a pull request
    Given I have a GitHub repository named "test-repo" with a branch "main"
    And the repository has a branch named "feature"
    When I define a `resource_github_repository_pull_request` with the following attributes:
      | base_repository | "test-repo"    |
      | base_ref        | "main"         |
      | head_ref        | "feature"      |
      | title           | "My New PR"    |
      | body            | "This is my new PR." |
    Then a pull request with the title "My New PR" should be created in the "test-repo" repository
    And the pull request should have the body "This is my new PR."
    And the pull request should be open

  Scenario: Update a pull request
    Given I have a pull request with the title "My New PR"
    When I update the `resource_github_repository_pull_request` with the following attributes:
      | title | "My Updated PR" |
    Then the pull request should be updated
    And the pull request should have the title "My Updated PR"

  Scenario: Delete a pull request
    Given I have a pull request with the title "My New PR"
    When I delete the `resource_github_repository_pull_request`
    Then the pull request should be closed
