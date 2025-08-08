Feature: resource_github_actions_repository_access_level
  As a user of the Terraform GitHub Provider
  I want to be able to manage the access level of a repository's actions
  So that I can automate the management of my actions configuration.

  Scenario: Set the access level for a repository's actions
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_actions_repository_access_level` with the following attributes:
      | repository   | "test-repo"    |
      | access_level | "organization" |
    Then the access level for the repository's actions should be set to "organization"

  Scenario: Update the access level for a repository's actions
    Given I have a GitHub repository named "test-repo"
    And the access level for the repository's actions is set to "organization"
    When I update the `resource_github_actions_repository_access_level` with the following attributes:
      | access_level | "enterprise" |
    Then the access level for the repository's actions should be updated to "enterprise"

  Scenario: Delete the access level for a repository's actions
    Given I have a GitHub repository named "test-repo"
    And the access level for the repository's actions is set to "organization"
    When I delete the `resource_github_actions_repository_access_level`
    Then the access level for the repository's actions should be reset to "none"
