Feature: resource_github_organization_ruleset
  As a user of the Terraform GitHub Provider
  I want to be able to manage a ruleset for a GitHub organization
  So that I can automate the management of my repository rules.

  Scenario: Create a ruleset
    Given I have a GitHub organization
    When I define a `resource_github_organization_ruleset` with the following attributes:
      | name        | "my-ruleset" |
      | target      | "branch"     |
      | enforcement | "active"     |
    And a "conditions" block with the following attributes:
      | ref_name | { include = ["~DEFAULT_BRANCH"], exclude = [] } |
    And a "rules" block with the following attributes:
      | creation | true |
    Then a ruleset named "my-ruleset" should be created in the organization
    And the ruleset should have the target "branch"
    And the ruleset should have the enforcement "active"
    And the ruleset should have the correct conditions and rules

  Scenario: Update a ruleset
    Given I have a GitHub organization
    And the organization has a ruleset named "my-ruleset"
    When I update the `resource_github_organization_ruleset` with the following attributes:
      | enforcement | "disabled" |
    Then the ruleset "my-ruleset" should be updated
    And the ruleset should have the enforcement "disabled"

  Scenario: Delete a ruleset
    Given I have a GitHub organization
    And the organization has a ruleset named "my-ruleset"
    When I delete the `resource_github_organization_ruleset` with the name "my-ruleset"
    Then the ruleset "my-ruleset" should be deleted from the organization
