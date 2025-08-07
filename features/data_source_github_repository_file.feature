Feature: data_source_github_repository_file
  As a user of the Terraform GitHub Provider
  I want to be able to read a file from a GitHub repository
  So that I can use it in my Terraform configuration.

  Scenario: Read a file from a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has a file named "README.md" with the content "Hello World"
    When I define a `data_source_github_repository_file` resource with the following attributes:
      | repository | "test-repo" |
      | file       | "README.md" |
    Then the "content" attribute should be "Hello World"
    And the "ref" attribute should be a string
    And the "commit_sha" attribute should be a string
    And the "commit_message" attribute should be a string
    And the "commit_author" attribute should be a string
    And the "commit_email" attribute should be a string
    And the "sha" attribute should be a string
