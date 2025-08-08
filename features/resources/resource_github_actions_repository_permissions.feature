Feature: resource_github_actions_repository_permissions
  As a user of the Terraform GitHub Provider
  I want to be able to manage the actions permissions for a GitHub repository
  So that I can automate the management of my actions configuration.

  Scenario: Set actions permissions for a repository
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_actions_repository_permissions` with the following attributes:
      | repository      | "test-repo"  |
      | allowed_actions | "selected"   |
      | enabled         | true         |
    And an "allowed_actions_config" block with the following attributes:
      | github_owned_allowed | true |
      | patterns_allowed     | ["actions/cache@*", "actions/checkout@*"] |
    Then the actions permissions for the repository should be updated
    And the "allowed_actions" attribute should be "selected"
    And the "enabled" attribute should be true
    And the "allowed_actions_config" should be set correctly

  Scenario: Update actions permissions for a repository
    Given I have a GitHub repository named "test-repo"
    And the repository has actions permissions set
    When I update the `resource_github_actions_repository_permissions` with the following attributes:
      | enabled | false |
    Then the actions permissions for the repository should be updated
    And the "enabled" attribute should be false

  Scenario: Delete actions permissions for a repository
    Given I have a GitHub repository named "test-repo"
    And the repository has actions permissions set
    When I delete the `resource_github_actions_repository_permissions`
    Then the actions permissions for the repository should be reset to the default
