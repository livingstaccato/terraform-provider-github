Feature: data_source_github_repository_milestone
  As a user of the Terraform GitHub Provider
  I want to be able to read a milestone from a GitHub repository
  So that I can use it in my Terraform configuration.

  Scenario: Read a milestone from a GitHub repository
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has a milestone with the number 1, title "My Milestone", and state "open"
    When I define a `data_source_github_repository_milestone` resource with the following attributes:
      | owner      | "my-org"    |
      | repository | "test-repo" |
      | number     | 1           |
    Then the "title" attribute should be "My Milestone"
    And the "state" attribute should be "open"
    And the "description" attribute should be a string
    And the "due_date" attribute should be a string
