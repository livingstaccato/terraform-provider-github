Feature: resource_github_repository_environment_deployment_policy
  As a user of the Terraform GitHub Provider
  I want to be able to manage a deployment policy for a repository environment
  So that I can automate the management of my deployment policies.

  Scenario: Create a deployment policy with a branch pattern
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I define a `resource_github_repository_environment_deployment_policy` with the following attributes:
      | repository     | "test-repo"  |
      | environment    | "production" |
      | branch_pattern | "main"       |
    Then a deployment policy with the branch pattern "main" should be created for the "production" environment

  Scenario: Create a deployment policy with a tag pattern
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I define a `resource_github_repository_environment_deployment_policy` with the following attributes:
      | repository   | "test-repo"  |
      | environment  | "production" |
      | tag_pattern  | "v*"         |
    Then a deployment policy with the tag pattern "v*" should be created for the "production" environment

  Scenario: Update a deployment policy
    Given I have a deployment policy with the branch pattern "main"
    When I update the `resource_github_repository_environment_deployment_policy` with the following attributes:
      | branch_pattern | "release/*" |
    Then the deployment policy should be updated to have the branch pattern "release/*"

  Scenario: Delete a deployment policy
    Given I have a deployment policy
    When I delete the `resource_github_repository_environment_deployment_policy`
    Then the deployment policy should be deleted
