Feature: data_source_github_repository_custom_properties
  As a user of the Terraform GitHub Provider
  I want to be able to read the custom properties for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read custom properties for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has a custom property with the name "my-property" and value "my-value"
    When I define a `data_source_github_repository_custom_properties` resource with the following attributes:
      | repository | "test-repo" |
    Then the "property" attribute should be a list of properties
    And the list of properties should contain a property with the following attributes:
      | property_name  | "my-property" |
      | property_value | ["my-value"]  |
