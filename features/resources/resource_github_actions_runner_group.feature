Feature: resource_github_actions_runner_group
  As a user of the Terraform GitHub Provider
  I want to be able to manage an actions runner group
  So that I can automate the management of my runners.

  Scenario: Create an actions runner group
    Given I have a GitHub organization
    When I define a `resource_github_actions_runner_group` with the following attributes:
      | name       | "my-runner-group" |
      | visibility | "all"             |
    Then the runner group "my-runner-group" should be created for the organization
    And the runner group should have the visibility "all"

  Scenario: Update an actions runner group
    Given I have a GitHub organization
    And the organization has a runner group named "my-runner-group" with visibility "all"
    When I update the `resource_github_actions_runner_group` with the following attributes:
      | visibility | "selected" |
      | selected_repository_ids | [12345] |
    Then the runner group "my-runner-group" should be updated for the organization
    And the runner group should have the visibility "selected"
    And the runner group should be accessible by the repository with id 12345

  Scenario: Delete an actions runner group
    Given I have a GitHub organization
    And the organization has a runner group named "my-runner-group"
    When I delete the `resource_github_actions_runner_group` with the name "my-runner-group"
    Then the runner group "my-runner-group" should be deleted from the organization
