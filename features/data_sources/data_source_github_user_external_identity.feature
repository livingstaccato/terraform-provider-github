Feature: data_source_github_user_external_identity
  As a user of the Terraform GitHub Provider
  I want to be able to read the external identity of a user in a GitHub organization
  So that I can use it in my Terraform configuration.

  Scenario: Read the external identity of a user in a GitHub organization
    Given I have a GitHub organization named "my-org"
    And the user "test-user" has an external identity in the organization
    When I define a `data_source_github_user_external_identity` resource with the following attributes:
      | username | "test-user" |
    Then the "login" attribute should be "test-user"
    And the "saml_identity" attribute should be a map of strings
    And the "scim_identity" attribute should be a map of strings
