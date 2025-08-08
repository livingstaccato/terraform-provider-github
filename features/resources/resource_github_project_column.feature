Feature: resource_github_project_column
  As a user of the Terraform GitHub Provider
  I want to be able to manage a project column
  So that I can automate the management of my projects.

  Scenario: Create a project column
    Given I have a project with the id "PROJECT_ID"
    When I define a `resource_github_project_column` with the following attributes:
      | project_id | "PROJECT_ID" |
      | name       | "To Do"      |
    Then a project column named "To Do" should be created in the project
    And the column should have the name "To Do"

  Scenario: Update a project column
    Given I have a project column named "To Do"
    When I update the `resource_github_project_column` with the following attributes:
      | name | "In Progress" |
    Then the project column should be updated
    And the column should have the name "In Progress"

  Scenario: Delete a project column
    Given I have a project column named "To Do"
    When I delete the `resource_github_project_column` with the name "To Do"
    Then the project column "To Do" should be deleted
