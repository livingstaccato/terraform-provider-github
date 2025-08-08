Feature: resource_github_actions_environment_secret
  As a user of the Terraform GitHub Provider
  I want to be able to manage an actions environment secret
  So that I can automate the management of my secrets.

  Scenario: Create an actions environment secret with a plaintext value
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I define a `resource_github_actions_environment_secret` with the following attributes:
      | repository      | "test-repo"   |
      | environment     | "production"  |
      | secret_name     | "MY_SECRET"   |
      | plaintext_value | "my-value"    |
    Then the secret "MY_SECRET" should be created in the "production" environment of the "test-repo" repository
    And the secret should have a value that decrypts to "my-value"

  Scenario: Create an actions environment secret with an encrypted value
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I define a `resource_github_actions_environment_secret` with the following attributes:
      | repository      | "test-repo"     |
      | environment     | "production"    |
      | secret_name     | "MY_SECRET"     |
      | encrypted_value | "..."           |
    Then the secret "MY_SECRET" should be created in the "production" environment of the "test-repo" repository
    And the secret should have the encrypted value "..."

  Scenario: Delete an actions environment secret
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    And the environment has a secret named "MY_SECRET"
    When I delete the `resource_github_actions_environment_secret` with the secret name "MY_SECRET"
    Then the secret "MY_SECRET" should be deleted from the "production" environment of the "test-repo" repository
