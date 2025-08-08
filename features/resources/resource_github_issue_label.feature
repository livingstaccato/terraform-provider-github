Feature: resource_github_issue_label
  As a user of the Terraform GitHub Provider
  I want to be able to manage an issue label in a GitHub repository
  So that I can automate the management of my labels.

  Scenario: Create an issue label
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_issue_label` with the following attributes:
      | repository  | "test-repo" |
      | name        | "bug"       |
      | color       | "d73a4a"    |
      | description | "Something isn't working" |
    Then a label named "bug" should be created in the "test-repo" repository
    And the label should have the color "d73a4a"
    And the label should have the description "Something isn't working"

  Scenario: Update an issue label
    Given I have a GitHub repository named "test-repo"
    And the repository has a label named "bug"
    When I update the `resource_github_issue_label` with the following attributes:
      | color | "000000" |
    Then the label "bug" should be updated
    And the label should have the color "000000"

  Scenario: Delete an issue label
    Given I have a GitHub repository named "test-repo"
    And the repository has a label named "bug"
    When I delete the `resource_github_issue_label` with the name "bug"
    Then the label "bug" should be deleted from the "test-repo" repository
