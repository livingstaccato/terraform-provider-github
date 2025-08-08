Feature: data_source_github_repository_pull_requests
  As a user of the Terraform GitHub Provider
  I want to be able to read pull requests from a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read pull requests from a GitHub repository
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has a pull request with the number 1, title "My Pull Request", and state "open"
    When I define a `data_source_github_repository_pull_requests` resource with the following attributes:
      | base_repository | "test-repo" |
      | owner           | "my-org"    |
      | state           | "open"      |
    Then the "results" attribute should be a list of pull requests
    And the list of pull requests should contain a pull request with the following attributes:
      | number | 1                 |
      | title  | "My Pull Request" |
      | state  | "open"            |
