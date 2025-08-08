Feature: resource_github_codespaces_organization_secret
  As a user of the Terraform GitHub Provider
  I want to be able to manage a codespaces organization secret
  So that I can automate the management of my secrets.

  Scenario: Create a codespaces organization secret with a plaintext value
    Given I have a GitHub organization
    When I define a `resource_github_codespaces_organization_secret` with the following attributes:
      | secret_name     | "MY_SECRET" |
      | visibility      | "all"       |
      | plaintext_value | "my-value"  |
    Then the codespaces secret "MY_SECRET" should be created for the organization
    And the secret should have the visibility "all"
    And the secret should have a value that decrypts to "my-value"

  Scenario: Create a codespaces organization secret with an encrypted value
    Given I have a GitHub organization
    When I define a `resource_github_codespaces_organization_secret` with the following attributes:
      | secret_name     | "MY_SECRET" |
      | visibility      | "private"   |
      | encrypted_value | "..."       |
    Then the codespaces secret "MY_SECRET" should be created for the organization
    And the secret should have the visibility "private"
    And the secret should have the encrypted value "..."

  Scenario: Create a codespaces organization secret with selected repositories
    Given I have a GitHub organization
    And the organization has a repository with the id 12345
    When I define a `resource_github_codespaces_organization_secret` with the following attributes:
      | secret_name             | "MY_SECRET" |
      | visibility              | "selected"  |
      | plaintext_value         | "my-value"  |
      | selected_repository_ids | [12345]     |
    Then the codespaces secret "MY_SECRET" should be created for the organization
    And the secret should have the visibility "selected"
    And the secret should be accessible by the repository with id 12345

  Scenario: Delete a codespaces organization secret
    Given I have a GitHub organization
    And the organization has a codespaces secret named "MY_SECRET"
    When I delete the `resource_github_codespaces_organization_secret` with the secret name "MY_SECRET"
    Then the codespaces secret "MY_SECRET" should be deleted from the organization
