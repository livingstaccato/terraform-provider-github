Feature: data_source_github_membership
  As a user of the Terraform GitHub Provider
  I want to be able to read the membership information for a user in a GitHub organization
  So that I can use it in my Terraform configuration.

  Scenario: Read membership information for a user in a GitHub organization
    Given I have a GitHub organization named "my-org"
    And the user "test-user" is a member of the organization with the role "member" and state "active"
    When I define a `data_source_github_membership` resource with the following attributes:
      | username     | "test-user" |
      | organization | "my-org"    |
    Then the "role" attribute should be "member"
    And the "state" attribute should be "active"
