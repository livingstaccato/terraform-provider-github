Feature: data_source_github_repository_pull_request
  As a user of the Terraform GitHub Provider
  I want to be able to read a pull request from a GitHub repository
  So that I can use it in my Terraform configuration.

  Scenario: Read a pull request from a GitHub repository
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has a pull request with the number 1, title "My Pull Request", and state "open"
    When I define a `data_source_github_repository_pull_request` resource with the following attributes:
      | base_repository | "test-repo" |
      | owner           | "my-org"    |
      | number          | 1           |
    Then the "title" attribute should be "My Pull Request"
    And the "state" attribute should be "open"
    And the "base_ref" attribute should be a string
    And the "base_sha" attribute should be a string
    And the "body" attribute should be a string
    And the "draft" attribute should be a boolean
    And the "head_owner" attribute should be a string
    And the "head_ref" attribute should be a string
    And the "head_repository" attribute should be a string
    And the "head_sha" attribute should be a string
    And the "labels" attribute should be a list of strings
    And the "maintainer_can_modify" attribute should be a boolean
    And the "opened_at" attribute should be an integer
    And the "opened_by" attribute should be a string
    And the "updated_at" attribute should be an integer
