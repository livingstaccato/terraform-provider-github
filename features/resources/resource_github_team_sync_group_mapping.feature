Feature: resource_github_team_sync_group_mapping
  As a user of the Terraform GitHub Provider
  I want to be able to manage the group mapping for a team
  So that I can automate the management of my teams.

  Scenario: Create a group mapping for a team
    Given I have a team with the slug "my-team"
    When I define a `resource_github_team_sync_group_mapping` with the following attributes:
      | team_slug | "my-team" |
    And a "group" block with the following attributes:
      | group_id          | "GROUP_ID"           |
      | group_name        | "My Group"           |
      | group_description | "My Group Description" |
    Then the group mapping for the team "my-team" should be created
    And the team should be mapped to the group "GROUP_ID"

  Scenario: Update a group mapping for a team
    Given I have a team with the slug "my-team"
    And the team is mapped to the group "GROUP_ID"
    When I update the `resource_github_team_sync_group_mapping` to have an empty "group" block
    Then the group mapping for the team "my-team" should be removed

  Scenario: Delete a group mapping for a team
    Given I have a team with the slug "my-team"
    And the team is mapped to a group
    When I delete the `resource_github_team_sync_group_mapping` for the team "my-team"
    Then the group mapping for the team "my-team" should be removed
