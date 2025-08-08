Feature: resource_github_repository_milestone
  As a user of the Terraform GitHub Provider
  I want to be able to manage a milestone in a GitHub repository
  So that I can automate the management of my milestones.

  Scenario: Create a milestone
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    When I define a `resource_github_repository_milestone` with the following attributes:
      | owner       | "my-org"       |
      | repository  | "test-repo"    |
      | title       | "v1.0"         |
      | description | "Version 1.0"  |
      | due_date    | "2025-12-31"   |
      | state       | "open"         |
    Then a milestone with the title "v1.0" should be created in the "test-repo" repository
    And the milestone should have the description "Version 1.0"
    And the milestone should have the due date "2025-12-31"
    And the milestone should have the state "open"

  Scenario: Update a milestone
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has a milestone with the title "v1.0"
    When I update the `resource_github_repository_milestone` with the following attributes:
      | state | "closed" |
    Then the milestone should be updated
    And the milestone should have the state "closed"

  Scenario: Delete a milestone
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has a milestone with the title "v1.0"
    When I delete the `resource_github_repository_milestone` with the title "v1.0"
    Then the milestone "v1.0" should be deleted from the "test-repo" repository
