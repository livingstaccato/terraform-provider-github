Feature: data_source_github_app
  As a user of the Terraform GitHub Provider
  I want to be able to read the information about a GitHub App
  So that I can use it in my Terraform configuration.

  Scenario: Read information about a GitHub App
    Given I have a GitHub App with the slug "my-app"
    And the app has the name "My App"
    And the app has the description "My App Description"
    When I define a `data_source_github_app` resource with the following attributes:
      | slug | "my-app" |
    Then the "name" attribute should be "My App"
    And the "description" attribute should be "My App Description"
    And the "node_id" attribute should be a string
