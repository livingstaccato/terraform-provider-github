Feature: resource_github_repository_environment
  As a user of the Terraform GitHub Provider
  I want to be able to manage a repository environment
  So that I can automate the management of my deployment environments.

  Scenario: Create a repository environment
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_repository_environment` with the following attributes:
      | repository  | "test-repo"  |
      | environment | "production" |
      | wait_timer  | 10           |
    And a "deployment_branch_policy" block with the following attributes:
      | protected_branches     | true |
      | custom_branch_policies | true |
    Then an environment named "production" should be created in the "test-repo" repository
    And the environment should have a wait timer of 10 minutes
    And the environment should have a deployment branch policy

  Scenario: Update a repository environment
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I update the `resource_github_repository_environment` with the following attributes:
      | wait_timer | 20 |
    Then the environment "production" should be updated
    And the environment should have a wait timer of 20 minutes

  Scenario: Delete a repository environment
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I delete the `resource_github_repository_environment` with the name "production"
    Then the environment "production" should be deleted from the "test-repo" repository
