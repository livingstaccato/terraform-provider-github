Feature: resource_github_branch_protection
  As a user of the Terraform GitHub Provider
  I want to be able to manage a branch protection rule for a GitHub repository
  So that I can automate the management of my branches.

  Scenario: Create a branch protection rule
    Given I have a GitHub repository with the node_id "REPO_ID"
    When I define a `resource_github_branch_protection` with the following attributes:
      | repository_id | "REPO_ID" |
      | pattern       | "main"    |
    And a "requires_status_checks" block with the following attributes:
      | strict   | true       |
      | contexts | ["ci/travis-ci"] |
    And a "requires_approving_reviews" block with the following attributes:
      | required_approving_review_count | 2 |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the rule should require status checks
    And the rule should require 2 approving reviews

  Scenario: Update a branch protection rule
    Given I have a GitHub repository with the node_id "REPO_ID"
    And the repository has a branch protection rule for the "main" branch
    When I update the `resource_github_branch_protection` with the following attributes:
      | allows_deletions | true |
    Then the branch protection rule for the "main" branch should be updated
    And the rule should allow deletions

  Scenario: Delete a branch protection rule
    Given I have a GitHub repository with the node_id "REPO_ID"
    And the repository has a branch protection rule for the "main" branch
    When I delete the `resource_github_branch_protection` for the "main" branch
    Then the branch protection rule for the "main" branch should be deleted
