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

  Scenario: Create a repository with a license and gitignore
    When I define a `resource_github_repository` with the following attributes:
      | name               | "my-repo-with-license" |
      | license_template   | "mit"                  |
      | gitignore_template | "Go"                   |
    Then a repository named "my-repo-with-license" should be created
    And the repository should have a "MIT" license
    And the repository should have a ".gitignore" file for "Go"

  Scenario: Create a repository from a template
    Given I have a template repository named "my-template-repo"
    When I define a `resource_github_repository` with the following attributes:
      | name | "my-repo-from-template" |
    And a "template" block with the following attributes:
      | owner      | "my-org"             |
      | repository | "my-template-repo"   |
    Then a repository named "my-repo-from-template" should be created from the template "my-template-repo"

  Scenario: Create a repository with GitHub Pages
    Given I have a repository named "my-repo-with-pages"
    When I define a `resource_github_repository` with the following attributes:
      | name | "my-repo-with-pages" |
    And a "pages" block with the following attributes:
      | source | { branch = "main", path = "/docs" } |
    Then a repository named "my-repo-with-pages" should be created
    And GitHub Pages should be enabled for the repository
    And the source for GitHub Pages should be the "/docs" directory on the "main" branch

  Scenario: Create a repository with topics
    When I define a `resource_github_repository` with the following attributes:
      | name   | "my-repo-with-topics" |
      | topics | ["terraform", "github"] |
    Then a repository named "my-repo-with-topics" should be created
    And the repository should have the topics "terraform" and "github"

  Scenario: Create a repository with security and analysis settings
    When I define a `resource_github_repository` with the following attributes:
      | name       | "my-repo-with-security" |
      | visibility | "private"                 |
    And a "security_and_analysis" block with the following attributes:
      | advanced_security | { status = "enabled" } |
      | secret_scanning   | { status = "enabled" } |
    Then a repository named "my-repo-with-security" should be created
    And advanced security should be enabled for the repository
    And secret scanning should be enabled for the repository
