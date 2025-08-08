Feature: resource_github_team
  As a user of the Terraform GitHub Provider
  I want to be able to manage a team
  So that I can automate the management of my teams.

  Scenario: Create a team
    Given I have a GitHub organization
    When I define a `resource_github_team` with the following attributes:
      | name        | "My Team"    |
      | description | "My new team" |
      | privacy     | "secret"     |
    Then a team named "My Team" should be created in the organization
    And the team should have the description "My new team"
    And the team should have the privacy "secret"

  Scenario: Update a team
    Given I have a team named "My Team"
    When I update the `resource_github_team` with the following attributes:
      | description | "My updated team" |
    Then the team "My Team" should be updated
    And the team should have the description "My updated team"

  Scenario: Delete a team
    Given I have a team named "My Team"
    When I delete the `resource_github_team` with the name "My Team"
    Then the team "My Team" should be deleted from the organization
