Feature: resource_github_enterprise_actions_permissions
  As a user of the Terraform GitHub Provider
  I want to be able to manage the actions permissions for a GitHub enterprise
  So that I can automate the management of my actions configuration.

  Scenario: Set actions permissions for an enterprise
    Given I have a GitHub enterprise with the slug "my-enterprise"
    When I define a `resource_github_enterprise_actions_permissions` with the following attributes:
      | enterprise_slug       | "my-enterprise" |
      | allowed_actions       | "selected"      |
      | enabled_organizations | "all"           |
    And an "allowed_actions_config" block with the following attributes:
      | github_owned_allowed | true |
      | patterns_allowed     | ["actions/cache@*", "actions/checkout@*"] |
    Then the actions permissions for the enterprise should be updated
    And the "allowed_actions" attribute should be "selected"
    And the "enabled_organizations" attribute should be "all"
    And the "allowed_actions_config" should be set correctly

  Scenario: Update actions permissions for an enterprise
    Given I have a GitHub enterprise with the slug "my-enterprise"
    And the enterprise has actions permissions set
    When I update the `resource_github_enterprise_actions_permissions` with the following attributes:
      | enabled_organizations | "selected" |
    And an "enabled_organizations_config" block with the following attributes:
      | organization_ids | [12345] |
    Then the actions permissions for the enterprise should be updated
    And the "enabled_organizations" attribute should be "selected"
    And the "enabled_organizations_config" should be set correctly

  Scenario: Delete actions permissions for an enterprise
    Given I have a GitHub enterprise with the slug "my-enterprise"
    And the enterprise has actions permissions set
    When I delete the `resource_github_enterprise_actions_permissions`
    Then the actions permissions for the enterprise should be reset to the default
