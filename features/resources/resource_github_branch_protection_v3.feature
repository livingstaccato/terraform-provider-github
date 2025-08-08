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

  Scenario: Create a branch protection rule with push restrictions
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    And I have a user with the username "test-user"
    When I define a `resource_github_branch_protection_v3` with the following attributes:
      | repository | "test-repo" |
      | branch     | "main"      |
    And a "restrictions" block with the following attributes:
      | users | ["test-user"] |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the rule should restrict pushes to "test-user"

  Scenario: Create a branch protection rule that requires signed commits
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `resource_github_branch_protection_v3` with the following attributes:
      | repository             | "test-repo" |
      | branch                 | "main"      |
      | require_signed_commits | true        |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the rule should require signed commits

  Scenario: Create a branch protection rule that requires conversation resolution
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `resource_github_branch_protection_v3` with the following attributes:
      | repository                      | "test-repo" |
      | branch                          | "main"      |
      | require_conversation_resolution | true        |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the rule should require conversation resolution

  Scenario: Create a branch protection rule that dismisses stale reviews
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `resource_github_branch_protection_v3` with the following attributes:
      | repository | "test-repo" |
      | branch     | "main"      |
    And a "required_pull_request_reviews" block with the following attributes:
      | dismiss_stale_reviews | true |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the rule should dismiss stale reviews

  Scenario: Create a branch protection rule that requires code owner reviews
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `resource_github_branch_protection_v3` with the following attributes:
      | repository | "test-repo" |
      | branch     | "main"      |
    And a "required_pull_request_reviews" block with the following attributes:
      | require_code_owner_reviews | true |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the rule should require code owner reviews

  Scenario: Create a branch protection rule that requires last push approval
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    When I define a `resource_github_branch_protection_v3` with the following attributes:
      | repository | "test-repo" |
      | branch     | "main"      |
    And a "required_pull_request_reviews" block with the following attributes:
      | require_last_push_approval | true |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the rule should require last push approval

  Scenario: Create a branch protection rule with bypass pull request allowances
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch named "main"
    And I have a user with the username "test-user"
    When I define a `resource_github_branch_protection_v3` with the following attributes:
      | repository | "test-repo" |
      | branch     | "main"      |
    And a "required_pull_request_reviews" block with the following attributes:
      | required_approving_review_count | 1 |
    And a "bypass_pull_request_allowances" block with the following attributes:
      | users | ["test-user"] |
    Then a branch protection rule for the "main" branch should be created in the repository
    And the user "test-user" should be able to bypass pull request requirements
