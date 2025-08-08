Feature: resource_github_actions_organization_permissions
  As a user of the Terraform GitHub Provider
  I want to be able to manage the actions permissions for a GitHub organization
  So that I can automate the management of my actions configuration.

  Scenario: Set actions permissions for an organization
    Given I have a GitHub organization
    When I define a `resource_github_actions_organization_permissions` with the following attributes:
      | allowed_actions      | "selected" |
      | enabled_repositories | "all"      |
    And an "allowed_actions_config" block with the following attributes:
      | github_owned_allowed | true |
      | patterns_allowed     | ["actions/cache@*", "actions/checkout@*"] |
    Then the actions permissions for the organization should be updated
    And the "allowed_actions" attribute should be "selected"
    And the "enabled_repositories" attribute should be "all"
    And the "allowed_actions_config" should be set correctly

  Scenario: Update actions permissions for an organization
    Given I have a GitHub organization
    And the organization has actions permissions set
    When I update the `resource_github_actions_organization_permissions` with the following attributes:
      | enabled_repositories | "selected" |
    And an "enabled_repositories_config" block with the following attributes:
      | repository_ids | [12345] |
    Then the actions permissions for the organization should be updated
    And the "enabled_repositories" attribute should be "selected"
    And the "enabled_repositories_config" should be set correctly

  Scenario: Delete actions permissions for an organization
    Given I have a GitHub organization
    And the organization has actions permissions set
    When I delete the `resource_github_actions_organization_permissions`
    Then the actions permissions for the organization should be reset to the default
