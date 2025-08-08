Feature: resource_github_branch_protection_v3
  As a user of the Terraform GitHub Provider
  I want to be able to manage a branch protection rule for a GitHub repository using the v3 API
  So that I can automate the management of my branches.

  Scenario: Create a branch protection rule
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `resource_github_branch_protection_v3` with the following attributes:
      | repository | "test-repo" |
      | branch     | "main"      |
    And a "required_status_checks" block with the following attributes:
      | strict   | true       |
      | contexts | ["ci/travis-ci"] |
    And a "required_pull_request_reviews" block with the following attributes:
      | required_approving_review_count | 2 |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the rule should require status checks
    And the rule should require 2 approving reviews

  Scenario: Update a branch protection rule
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch protection rule for the "main" branch
    When I update the `resource_github_branch_protection_v3` with the following attributes:
      | enforce_admins | true |
    Then the branch protection rule for the "main" branch should be updated
    And the rule should enforce checks for admins

  Scenario: Delete a branch protection rule
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch protection rule for the "main" branch
    When I delete the `resource_github_branch_protection_v3` for the "main" branch
    Then the branch protection rule for the "main" branch should be deleted
