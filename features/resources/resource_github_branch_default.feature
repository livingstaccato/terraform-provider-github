Feature: resource_github_branch_default
  As a user of the Terraform GitHub Provider
  I want to be able to manage the default branch of a GitHub repository
  So that I can automate the management of my branches.

  Scenario: Set the default branch
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "develop"
    When I define a `resource_github_branch_default` with the following attributes:
      | repository | "test-repo" |
      | branch     | "develop"   |
    Then the default branch for the "test-repo" repository should be "develop"

  Scenario: Rename the default branch
    Given I have a GitHub repository named "test-repo"
    And the default branch for the repository is "main"
    When I define a `resource_github_branch_default` with the following attributes:
      | repository | "test-repo" |
      | branch     | "release"   |
      | rename     | true        |
    Then the default branch for the "test-repo" repository should be "release"
    And the branch "main" should be renamed to "release"
