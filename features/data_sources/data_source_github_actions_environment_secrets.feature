Feature: data_source_github_actions_environment_secrets
  As a user of the Terraform GitHub Provider
  I want to be able to read the secrets for a GitHub Actions environment
  So that I can use them in my Terraform configuration.

  Scenario: Read secrets for a GitHub Actions environment using full_name
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has an environment named "production"
    And the "production" environment has a secret named "MY_SECRET"
    When I define a `data_source_github_actions_environment_secrets` resource with the following attributes:
      | full_name   | "my-org/test-repo" |
      | environment | "production"       |
    Then the "secrets" attribute should be a list of secrets
    And the list of secrets should contain a secret with the following attributes:
      | name       | "MY_SECRET" |
      | created_at | (a string)  |
      | updated_at | (a string)  |

  Scenario: Read secrets for a GitHub Actions environment using name
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    And the "production" environment has a secret named "MY_SECRET"
    When I define a `data_source_github_actions_environment_secrets` resource with the following attributes:
      | name        | "test-repo"  |
      | environment | "production" |
    Then the "secrets" attribute should be a list of secrets
    And the list of secrets should contain a secret with the following attributes:
      | name       | "MY_SECRET" |
      | created_at | (a string)  |
      | updated_at | (a string)  |
