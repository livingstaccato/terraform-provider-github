Feature: data_source_github_actions_organization_registration_token
  As a user of the Terraform GitHub Provider
  I want to be able to create a registration token for a GitHub organization
  So that I can use it to register a self-hosted runner.

  Scenario: Create a registration token for a GitHub organization
    Given I have a GitHub organization
    When I define a `data_source_github_actions_organization_registration_token` resource
    Then the "token" attribute should be a string
    And the "expires_at" attribute should be an integer
