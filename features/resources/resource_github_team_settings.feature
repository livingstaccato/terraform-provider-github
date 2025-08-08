Feature: resource_github_team_settings
  As a user of the Terraform GitHub Provider
  I want to be able to manage the settings of a team
  So that I can automate the management of my teams.

  Scenario: Enable review request delegation for a team
    Given I have a team with the id "TEAM_ID"
    When I define a `resource_github_team_settings` with the following attributes:
      | team_id | "TEAM_ID" |
    And a "review_request_delegation" block with the following attributes:
      | algorithm    | "ROUND_ROBIN" |
      | member_count | 2             |
      | notify       | true          |
    Then review request delegation should be enabled for the team "TEAM_ID"
    And the algorithm should be "ROUND_ROBIN"
    And the member count should be 2
    And the notify setting should be true

  Scenario: Disable review request delegation for a team
    Given I have a team with the id "TEAM_ID"
    And review request delegation is enabled for the team
    When I update the `resource_github_team_settings` to have an empty "review_request_delegation" block
    Then review request delegation should be disabled for the team "TEAM_ID"
