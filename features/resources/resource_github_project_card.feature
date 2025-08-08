Feature: resource_github_project_card
  As a user of the Terraform GitHub Provider
  I want to be able to manage a project card
  So that I can automate the management of my projects.

  Scenario: Create a project card with a note
    Given I have a project column with the id "COLUMN_ID"
    When I define a `resource_github_project_card` with the following attributes:
      | column_id | "COLUMN_ID" |
      | note      | "My new card" |
    Then a project card with the note "My new card" should be created in the column
    And the card should have the note "My new card"

  Scenario: Create a project card with an issue
    Given I have a project column with the id "COLUMN_ID"
    And I have an issue with the id 12345
    When I define a `resource_github_project_card` with the following attributes:
      | column_id    | "COLUMN_ID" |
      | content_id   | 12345       |
      | content_type | "Issue"     |
    Then a project card for the issue with id 12345 should be created in the column

  Scenario: Update a project card
    Given I have a project card with the note "My new card"
    When I update the `resource_github_project_card` with the following attributes:
      | note | "My updated card" |
    Then the project card should be updated
    And the card should have the note "My updated card"

  Scenario: Delete a project card
    Given I have a project card
    When I delete the `resource_github_project_card`
    Then the project card should be deleted
