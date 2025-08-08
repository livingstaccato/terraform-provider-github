Feature: data_source_github_issue_labels
  As a user of the Terraform GitHub Provider
  I want to be able to read the issue labels for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read issue labels for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has an issue label with the name "bug" and color "d73a4a"
    When I define a `data_source_github_issue_labels` resource with the following attributes:
      | repository | "test-repo" |
    Then the "labels" attribute should be a list of labels
    And the list of labels should contain a label with the following attributes:
      | name  | "bug"     |
      | color | "d73a4a"  |
      | url   | (a string)|
