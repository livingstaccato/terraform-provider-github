Feature: resource_github_repository_custom_property
  As a user of the Terraform GitHub Provider
  I want to be able to manage a custom property on a GitHub repository
  So that I can automate the management of my repository metadata.

  Scenario: Create a custom property
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_repository_custom_property` with the following attributes:
      | repository     | "test-repo"   |
      | property_type  | "string"      |
      | property_name  | "my-property" |
      | property_value | ["my-value"]  |
    Then a custom property named "my-property" should be created on the "test-repo" repository
    And the property should have the value "my-value"

  Scenario: Delete a custom property
    Given I have a GitHub repository named "test-repo"
    And the repository has a custom property named "my-property"
    When I delete the `resource_github_repository_custom_property` with the name "my-property"
    Then the custom property "my-property" should be deleted from the "test-repo" repository
