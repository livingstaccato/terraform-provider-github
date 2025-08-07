Feature: data_source_github_ref
  As a user of the Terraform GitHub Provider
  I want to be able to read a git ref
  So that I can use it in my Terraform configuration.

  Scenario: Read a git ref
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `data_source_github_ref` resource with the following attributes:
      | repository | "test-repo"       |
      | ref        | "heads/main"      |
    Then the "sha" attribute should be a string
