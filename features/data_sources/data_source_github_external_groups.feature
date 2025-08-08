Feature: data_source_github_external_groups
  As a user of the Terraform GitHub Provider
  I want to be able to read the external groups for a GitHub organization
  So that I can use them in my Terraform configuration.

  Scenario: Read external groups for a GitHub organization
    Given I have a GitHub organization
    And the organization has an external group with the name "My Group" and id 123
    When I define a `data_source_github_external_groups` resource
    Then the "external_groups" attribute should be a list of external groups
    And the list of external groups should contain an external group with the following attributes:
      | group_id   | 123          |
      | group_name | "My Group"   |
      | updated_at | (a string)   |
