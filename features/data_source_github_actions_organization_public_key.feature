Feature: data_source_github_actions_organization_public_key
  As a user of the Terraform GitHub Provider
  I want to be able to read the public key for a GitHub organization
  So that I can use it to encrypt secrets.

  Scenario: Read the public key for a GitHub organization
    Given I have a GitHub organization
    When I define a `data_source_github_actions_organization_public_key` resource
    Then the "key_id" attribute should be a string
    And the "key" attribute should be a string
