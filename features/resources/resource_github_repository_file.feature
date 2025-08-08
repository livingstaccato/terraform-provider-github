Feature: resource_github_repository_file
  As a user of the Terraform GitHub Provider
  I want to be able to manage a file in a GitHub repository
  So that I can automate the management of my repository content.

  Scenario: Create a file
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_repository_file` with the following attributes:
      | repository | "test-repo"   |
      | file       | "README.md"   |
      | content    | "Hello World" |
    Then a file named "README.md" should be created in the "test-repo" repository
    And the file should have the content "Hello World"

  Scenario: Update a file
    Given I have a GitHub repository named "test-repo"
    And the repository has a file named "README.md" with the content "Hello World"
    When I update the `resource_github_repository_file` with the following attributes:
      | content | "Hello Universe" |
    Then the file "README.md" should be updated
    And the file should have the content "Hello Universe"

  Scenario: Delete a file
    Given I have a GitHub repository named "test-repo"
    And the repository has a file named "README.md"
    When I delete the `resource_github_repository_file` with the file path "README.md"
    Then the file "README.md" should be deleted from the "test-repo" repository
