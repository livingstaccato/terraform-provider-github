Feature: data_source_github_enterprise
  As a user of the Terraform GitHub Provider
  I want to be able to read the information about a GitHub enterprise
  So that I can use it in my Terraform configuration.

  Scenario: Read information about a GitHub enterprise
    Given I have a GitHub enterprise with the slug "my-enterprise"
    And the enterprise has the name "My Enterprise"
    And the enterprise has the description "My Enterprise Description"
    When I define a `data_source_github_enterprise` resource with the following attributes:
      | slug | "my-enterprise" |
    Then the "name" attribute should be "My Enterprise"
    And the "description" attribute should be "My Enterprise Description"
    And the "database_id" attribute should be an integer
    And the "created_at" attribute should be a string
    And the "url" attribute should be a string
