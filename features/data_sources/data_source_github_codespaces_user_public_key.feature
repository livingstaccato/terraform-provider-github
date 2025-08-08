Feature: data_source_github_codespaces_user_public_key
  As a user of the Terraform GitHub Provider
  I want to be able to read the public key for my user's codespaces secrets
  So that I can use it to encrypt secrets.

  Scenario: Read the public key for my user's codespaces secrets
    Given I am an authenticated user
    When I define a `data_source_github_codespaces_user_public_key` resource
    Then the "key_id" attribute should be a string
    And the "key" attribute should be a string
