Feature: data_source_github_branch_protection_rules
  As a user of the Terraform GitHub Provider
  I want to be able to read the branch protection rules for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read branch protection rules for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has a branch protection rule with the pattern "main"
    When I define a `data_source_github_branch_protection_rules` resource with the following attributes:
      | repository | "test-repo" |
    Then the "rules" attribute should be a list of rules
    And the list of rules should contain a rule with the following attributes:
      | pattern | "main" |
