Feature: data_source_github_codespaces_public_key
  As a user of the Terraform GitHub Provider
  I want to be able to read the public key for a GitHub repository's codespaces secrets
  So that I can use it to encrypt secrets.

  Scenario: Read the public key for a GitHub repository's codespaces secrets
    Given I have a GitHub repository named "test-repo"
    When I define a `data_source_github_codespaces_public_key` resource with the following attributes:
      | repository | "test-repo" |
    Then the "key_id" attribute should be a string
    And the "key" attribute should be a string
