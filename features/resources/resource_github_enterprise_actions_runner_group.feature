Feature: resource_github_enterprise_actions_runner_group
  As a user of the Terraform GitHub Provider
  I want to be able to manage an actions runner group for a GitHub enterprise
  So that I can automate the management of my runners.

  Scenario: Create an actions runner group for an enterprise
    Given I have a GitHub enterprise with the slug "my-enterprise"
    When I define a `resource_github_enterprise_actions_runner_group` with the following attributes:
      | enterprise_slug | "my-enterprise"   |
      | name            | "my-runner-group" |
      | visibility      | "all"             |
    Then the runner group "my-runner-group" should be created for the enterprise
    And the runner group should have the visibility "all"

  Scenario: Update an actions runner group for an enterprise
    Given I have a GitHub enterprise with the slug "my-enterprise"
    And the enterprise has a runner group named "my-runner-group" with visibility "all"
    When I update the `resource_github_enterprise_actions_runner_group` with the following attributes:
      | visibility                | "selected" |
      | selected_organization_ids | [12345]    |
    Then the runner group "my-runner-group" should be updated for the enterprise
    And the runner group should have the visibility "selected"
    And the runner group should be accessible by the organization with id 12345

  Scenario: Delete an actions runner group for an enterprise
    Given I have a GitHub enterprise with the slug "my-enterprise"
    And the enterprise has a runner group named "my-runner-group"
    When I delete the `resource_github_enterprise_actions_runner_group` with the name "my-runner-group"
    Then the runner group "my-runner-group" should be deleted from the enterprise
