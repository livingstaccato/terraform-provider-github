Feature: resource_github_repository_project
  As a user of the Terraform GitHub Provider
  I want to be able to manage a project in a GitHub repository
  So that I can automate the management of my projects.

  Scenario: Create a repository project
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_repository_project` with the following attributes:
      | repository | "test-repo"    |
      | name       | "My Project"   |
      | body       | "This is my project." |
    Then a project named "My Project" should be created in the "test-repo" repository
    And the project should have the body "This is my project."

  Scenario: Update a repository project
    Given I have a GitHub repository named "test-repo"
    And the repository has a project named "My Project"
    When I update the `resource_github_repository_project` with the following attributes:
      | body | "This is my updated project." |
    Then the project "My Project" should be updated
    And the project should have the body "This is my updated project."

  Scenario: Delete a repository project
    Given I have a GitHub repository named "test-repo"
    And the repository has a project named "My Project"
    When I delete the `resource_github_repository_project` with the name "My Project"
    Then the project "My Project" should be deleted from the "test-repo" repository
