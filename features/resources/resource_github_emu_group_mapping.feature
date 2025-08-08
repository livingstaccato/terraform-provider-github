Feature: resource_github_emu_group_mapping
  As a user of the Terraform GitHub Provider
  I want to be able to manage an EMU group mapping
  So that I can automate the management of my teams.

  Scenario: Create an EMU group mapping
    Given I have a GitHub organization
    And the organization has a team with the slug "my-team"
    And I have an external group with the id 12345
    When I define a `resource_github_emu_group_mapping` with the following attributes:
      | team_slug | "my-team" |
      | group_id  | 12345     |
    Then the EMU group mapping should be created
    And the team "my-team" should be mapped to the external group with id 12345

  Scenario: Update an EMU group mapping
    Given I have a GitHub organization
    And the organization has a team with the slug "my-team"
    And the team is mapped to the external group with id 12345
    And I have an external group with the id 67890
    When I update the `resource_github_emu_group_mapping` with the following attributes:
      | group_id | 67890 |
    Then the EMU group mapping should be updated
    And the team "my-team" should be mapped to the external group with id 67890

  Scenario: Delete an EMU group mapping
    Given I have a GitHub organization
    And the organization has a team with the slug "my-team"
    And the team is mapped to an external group
    When I delete the `resource_github_emu_group_mapping` for the team "my-team"
    Then the EMU group mapping should be deleted
