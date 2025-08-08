Feature: resource_github_issue
  As a user of the Terraform GitHub Provider
  I want to be able to manage an issue in a GitHub repository
  So that I can automate the management of my issues.

  Scenario: Create an issue
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_issue` with the following attributes:
      | repository | "test-repo"    |
      | title      | "My New Issue" |
      | body       | "This is the body of my new issue." |
      | labels     | ["bug", "documentation"] |
      | assignees  | ["test-user"] |
    Then an issue with the title "My New Issue" should be created in the "test-repo" repository
    And the issue should have the body "This is the body of my new issue."
    And the issue should have the labels "bug" and "documentation"
    And the issue should be assigned to "test-user"

  Scenario: Update an issue
    Given I have a GitHub repository named "test-repo"
    And the repository has an issue with the title "My New Issue"
    When I update the `resource_github_issue` with the following attributes:
      | title | "My Updated Issue" |
    Then the issue should be updated
    And the issue should have the title "My Updated Issue"

  Scenario: Delete an issue
    Given I have a GitHub repository named "test-repo"
    And the repository has an issue with the title "My New Issue"
    When I delete the `resource_github_issue` for the issue "My New Issue"
    Then the issue should be closed
