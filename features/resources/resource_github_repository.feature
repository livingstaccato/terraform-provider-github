Feature: resource_github_repository
  As a user of the Terraform GitHub Provider
  I want to be able to manage a GitHub repository
  So that I can automate the management of my repositories.

  Scenario: Create a repository
    When I define a `resource_github_repository` with the following attributes:
      | name        | "my-repo"    |
      | description | "My new repository" |
      | visibility  | "public"     |
    Then a repository named "my-repo" should be created
    And the repository should have the description "My new repository"
    And the repository should be public

  Scenario: Update a repository
    Given I have a repository named "my-repo"
    When I update the `resource_github_repository` with the following attributes:
      | description | "My updated repository" |
    Then the repository "my-repo" should be updated
    And the repository should have the description "My updated repository"

  Scenario: Delete a repository
    Given I have a repository named "my-repo"
    When I delete the `resource_github_repository` with the name "my-repo"
    Then the repository "my-repo" should be deleted

  Scenario: Archive a repository on destroy
    Given I have a repository named "my-repo"
    When I delete the `resource_github_repository` with the name "my-repo" and the attribute "archive_on_destroy" set to true
    Then the repository "my-repo" should be archived
