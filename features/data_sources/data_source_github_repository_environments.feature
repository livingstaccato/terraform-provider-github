Feature: data_source_github_repository_environments
  As a user of the Terraform GitHub Provider
  I want to be able to read the environments for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read environments for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I define a `data_source_github_repository_environments` resource with the following attributes:
      | repository | "test-repo" |
    Then the "environments" attribute should be a list of environments
    And the list of environments should contain an environment with the following attributes:
      | name    | "production" |
      | node_id | (a string)   |
