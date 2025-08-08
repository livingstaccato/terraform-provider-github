Feature: resource_github_issue_labels
  As a user of the Terraform GitHub Provider
  I want to be able to manage all issue labels in a GitHub repository
  So that I can automate the management of my labels.

  Scenario: Create issue labels
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_issue_labels` with the following attributes:
      | repository | "test-repo" |
    And a "label" block with the following attributes:
      | name  | "bug"       |
      | color | "d73a4a"    |
    And a "label" block with the following attributes:
      | name  | "documentation" |
      | color | "0075ca"        |
    Then the labels "bug" and "documentation" should be created in the "test-repo" repository

  Scenario: Update issue labels
    Given I have a GitHub repository named "test-repo"
    And the repository has the labels "bug" and "documentation"
    When I update the `resource_github_issue_labels` to only have a "label" block with the following attributes:
      | name  | "bug"       |
      | color | "d73a4a"    |
    Then the label "documentation" should be deleted from the "test-repo" repository

  Scenario: Delete issue labels
    Given I have a GitHub repository named "test-repo"
    And the repository has the labels "bug" and "documentation"
    When I delete the `resource_github_issue_labels`
    Then the labels "bug" and "documentation" should be deleted from the "test-repo" repository
