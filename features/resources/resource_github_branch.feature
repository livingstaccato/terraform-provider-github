Feature: resource_github_branch
  As a user of the Terraform GitHub Provider
  I want to be able to manage a branch in a GitHub repository
  So that I can automate the management of my branches.

  Scenario: Create a branch
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `resource_github_branch` with the following attributes:
      | repository    | "test-repo" |
      | branch        | "my-branch" |
      | source_branch | "main"      |
    Then the branch "my-branch" should be created in the "test-repo" repository
    And the branch should be created from the "main" branch

  Scenario: Delete a branch
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "my-branch"
    When I delete the `resource_github_branch` with the branch name "my-branch"
    Then the branch "my-branch" should be deleted from the "test-repo" repository
