Feature: data_source_github_repositories
  As a user of the Terraform GitHub Provider
  I want to be able to search for GitHub repositories
  So that I can use them in my Terraform configuration.

  Scenario: Search for GitHub repositories
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    When I define a `data_source_github_repositories` resource with the following attributes:
      | query | "org:my-org test-repo" |
    Then the "full_names" attribute should be a list of strings
    And the list of strings should contain "my-org/test-repo"
    And the "names" attribute should be a list of strings
    And the list of strings should contain "test-repo"
