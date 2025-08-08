Feature: data_source_github_repository_deploy_keys
  As a user of the Terraform GitHub Provider
  I want to be able to read the deploy keys for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read deploy keys for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has a deploy key with the title "My Deploy Key"
    When I define a `data_source_github_repository_deploy_keys` resource with the following attributes:
      | repository | "test-repo" |
    Then the "keys" attribute should be a list of keys
    And the list of keys should contain a key with the following attributes:
      | title    | "My Deploy Key" |
      | verified | true            |
      | id       | (an integer)    |
      | key      | (a string)      |
