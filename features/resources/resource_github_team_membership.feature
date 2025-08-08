Feature: resource_github_team_membership
  As a user of the Terraform GitHub Provider
  I want to be able to manage a user's membership in a team
  So that I can automate the management of my teams.

  Scenario: Add a member to a team
    Given I have a team with the id "TEAM_ID"
    And I have a user with the username "test-user"
    When I define a `resource_github_team_membership` with the following attributes:
      | team_id  | "TEAM_ID"   |
      | username | "test-user" |
      | role     | "member"    |
    Then the user "test-user" should be a member of the team "TEAM_ID"
    And the user should have the role "member"

  Scenario: Update a member's role in a team
    Given I have a team with the id "TEAM_ID"
    And the user "test-user" is a member of the team with the role "member"
    When I update the `resource_github_team_membership` with the following attributes:
      | role | "maintainer" |
    Then the user "test-user" should have the role "maintainer" in the team

  Scenario: Remove a member from a team
    Given I have a team with the id "TEAM_ID"
    And the user "test-user" is a member of the team
    When I delete the `resource_github_team_membership` for the user "test-user"
    Then the user "test-user" should be removed from the team
