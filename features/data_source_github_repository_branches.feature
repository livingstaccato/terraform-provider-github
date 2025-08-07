Feature: data_source_github_repository_branches
  As a user of the Terraform GitHub Provider
  I want to be able to read the branches for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read all branches for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main" which is protected
    And the repository has a branch named "develop" which is not protected
    When I define a `data_source_github_repository_branches` resource with the following attributes:
      | repository | "test-repo" |
    Then the "branches" attribute should be a list of branches
    And the list of branches should contain a branch with the following attributes:
      | name      | "main"    |
      | protected | true      |
    And the list of branches should contain a branch with the following attributes:
      | name      | "develop" |
      | protected | false     |

  Scenario: Read only protected branches for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main" which is protected
    And the repository has a branch named "develop" which is not protected
    When I define a `data_source_github_repository_branches` resource with the following attributes:
      | repository              | "test-repo" |
      | only_protected_branches | true        |
    Then the "branches" attribute should be a list of branches
    And the list of branches should contain a branch with the following attributes:
      | name      | "main"    |
      | protected | true      |
    And the list of branches should not contain a branch with the name "develop"

  Scenario: Read only non-protected branches for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main" which is protected
    And the repository has a branch named "develop" which is not protected
    When I define a `data_source_github_repository_branches` resource with the following attributes:
      | repository                  | "test-repo" |
      | only_non_protected_branches | true        |
    Then the "branches" attribute should be a list of branches
    And the list of branches should contain a branch with the following attributes:
      | name      | "develop" |
      | protected | false     |
    And the list of branches should not contain a branch with the name "main"
