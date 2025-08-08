Feature: resource_github_codespaces_user_secret
  As a user of the Terraform GitHub Provider
  I want to be able to manage a codespaces secret for my user
  So that I can automate the management of my secrets.

  Scenario: Create a codespaces user secret with a plaintext value
    Given I am an authenticated user
    When I define a `resource_github_codespaces_user_secret` with the following attributes:
      | secret_name     | "MY_SECRET" |
      | plaintext_value | "my-value"  |
    Then the codespaces secret "MY_SECRET" should be created for my user
    And the secret should have a value that decrypts to "my-value"

  Scenario: Create a codespaces user secret with an encrypted value
    Given I am an authenticated user
    When I define a `resource_github_codespaces_user_secret` with the following attributes:
      | secret_name     | "MY_SECRET" |
      | encrypted_value | "..."       |
    Then the codespaces secret "MY_SECRET" should be created for my user
    And the secret should have the encrypted value "..."

  Scenario: Create a codespaces user secret with selected repositories
    Given I am an authenticated user
    And I have a repository with the id 12345
    When I define a `resource_github_codespaces_user_secret` with the following attributes:
      | secret_name             | "MY_SECRET" |
      | plaintext_value         | "my-value"  |
      | selected_repository_ids | [12345]     |
    Then the codespaces secret "MY_SECRET" should be created for my user
    And the secret should be accessible by the repository with id 12345

  Scenario: Delete a codespaces user secret
    Given I am an authenticated user
    And I have a codespaces secret named "MY_SECRET"
    When I delete the `resource_github_codespaces_user_secret` with the secret name "MY_SECRET"
    Then the codespaces secret "MY_SECRET" should be deleted from my user
