Feature: Utility Functions
  As a developer of the Terraform GitHub Provider
  I want to use utility functions to simplify my code
  So that I can write more robust and maintainable code.

  Scenario: Check if the provider is configured for an organization
    Given the provider is configured for an organization
    When I call the "checkOrganization" function
    Then the function should not return an error

  Scenario: Check if the provider is not configured for an organization
    Given the provider is configured for a user
    When I call the "checkOrganization" function
    Then the function should return an error

  Scenario: Parse a two-part ID
    Given I have a two-part ID "foo:bar"
    When I call the "parseTwoPartID" function
    Then the function should return "foo" and "bar"

  Scenario: Build a two-part ID
    Given I have two strings "foo" and "bar"
    When I call the "buildTwoPartID" function
    Then the function should return "foo:bar"

  Scenario: Validate a secret name
    Given I have a valid secret name "MY_SECRET"
    When I call the "validateSecretNameFunc" function
    Then the function should not return an error

  Scenario: Validate an invalid secret name
    Given I have an invalid secret name "123_SECRET"
    When I call the "validateSecretNameFunc" function
    Then the function should return an error
