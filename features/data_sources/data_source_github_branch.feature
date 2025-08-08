Feature: data_source_github_branch
  As a user of the Terraform GitHub Provider
  I want to be able to read the information about a GitHub branch
  So that I can use it in my Terraform configuration.

  Scenario: Read information about a GitHub branch
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `data_source_github_branch` resource with the following attributes:
      | repository | "test-repo" |
      | branch     | "main"      |
    Then the "ref" attribute should be "refs/heads/main"
    And the "sha" attribute should be a string
