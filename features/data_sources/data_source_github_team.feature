Feature: data_source_github_team
  As a user of the Terraform GitHub Provider
  I want to be able to read a team from a GitHub organization
  So that I can use it in my Terraform configuration.

  Scenario: Read a team from a GitHub organization
    Given I have a GitHub organization
    And the organization has a team named "My Team" with slug "my-team" and privacy "closed"
    And the team has the member "test-user"
    And the team has the repository "test-repo"
    When I define a `data_source_github_team` resource with the following attributes:
      | slug | "my-team" |
    Then the "name" attribute should be "My Team"
    And the "privacy" attribute should be "closed"
    And the "description" attribute should be a string
    And the "permission" attribute should be a string
    And the "members" attribute should be a list of strings
    And the "repositories" attribute should be a list of strings
    And the "repositories_detailed" attribute should be a list of maps
    And the "node_id" attribute should be a string
