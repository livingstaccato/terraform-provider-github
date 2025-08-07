Feature: data_source_github_codespaces_secrets
  As a user of the Terraform GitHub Provider
  I want to be able to read the secrets for a GitHub repository's codespaces
  So that I can use them in my Terraform configuration.

  Scenario: Read secrets for a GitHub repository's codespaces
    Given I have a GitHub repository named "test-repo"
    And the repository has a codespaces secret named "MY_SECRET"
    When I define a `data_source_github_codespaces_secrets` resource with the following attributes:
      | full_name | "my-org/test-repo" |
    Then the "secrets" attribute should be a list of secrets
    And the list of secrets should contain a secret with the following attributes:
      | name       | "MY_SECRET" |
      | created_at | (a string)  |
      | updated_at | (a string)  |
