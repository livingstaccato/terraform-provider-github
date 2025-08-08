Feature: resource_github_team_members
  As a user of the Terraform GitHub Provider
  I want to be able to manage the members of a team
  So that I can automate the management of my teams.

  Scenario: Set the members of a team
    Given I have a team with the id "TEAM_ID"
    And I have a user with the username "test-user"
    When I define a `resource_github_team_members` with the following attributes:
      | team_id | "TEAM_ID" |
    And a "members" block with the following attributes:
      | username | "test-user" |
      | role     | "member"    |
    Then the user "test-user" should be a member of the team "TEAM_ID"
    And the user should have the role "member"

  Scenario: Update the members of a team
    Given I have a team with the id "TEAM_ID"
    And the user "test-user" is a member of the team with the role "member"
    When I update the `resource_github_team_members` to have a "members" block with the following attributes:
      | username | "test-user"  |
      | role     | "maintainer" |
    Then the user "test-user" should have the role "maintainer" in the team

  Scenario: Remove all members from a team
    Given I have a team with the id "TEAM_ID"
    And the team has members
    When I update the `resource_github_team_members` with an empty "members" block
    Then the team "TEAM_ID" should have no members
