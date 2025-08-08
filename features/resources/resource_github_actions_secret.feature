Feature: resource_github_actions_secret
  As a user of the Terraform GitHub Provider
  I want to be able to manage an actions secret in a repository
  So that I can automate the management of my secrets.

  Scenario: Create an actions secret with a plaintext value
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_actions_secret` with the following attributes:
      | repository      | "test-repo" |
      | secret_name     | "MY_SECRET" |
      | plaintext_value | "my-value"  |
    Then the secret "MY_SECRET" should be created in the "test-repo" repository
    And the secret should have a value that decrypts to "my-value"

  Scenario: Create an actions secret with an encrypted value
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_actions_secret` with the following attributes:
      | repository      | "test-repo" |
      | secret_name     | "MY_SECRET" |
      | encrypted_value | "..."       |
    Then the secret "MY_SECRET" should be created in the "test-repo" repository
    And the secret should have the encrypted value "..."

  Scenario: Delete an actions secret
    Given I have a GitHub repository named "test-repo"
    And the repository has a secret named "MY_SECRET"
    When I delete the `resource_github_actions_secret` with the secret name "MY_SECRET"
    Then the secret "MY_SECRET" should be deleted from the "test-repo" repository
