Feature: resource_github_repository_deployment_branch_policy
  As a user of the Terraform GitHub Provider
  I want to be able to manage a deployment branch policy for a GitHub repository's environment
  So that I can automate the management of my deployment policies.

  Scenario: Create a deployment branch policy
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    When I define a `resource_github_repository_deployment_branch_policy` with the following attributes:
      | repository       | "test-repo"  |
      | environment_name | "production" |
      | name             | "main"       |
    Then a deployment branch policy named "main" should be created for the "production" environment in the "test-repo" repository

  Scenario: Update a deployment branch policy
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    And the environment has a deployment branch policy named "main"
    When I update the `resource_github_repository_deployment_branch_policy` with the following attributes:
      | name | "release" |
    Then the deployment branch policy should be updated to "release"

  Scenario: Delete a deployment branch policy
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    And the environment has a deployment branch policy named "main"
    When I delete the `resource_github_repository_deployment_branch_policy` with the name "main"
    Then the deployment branch policy "main" should be deleted from the "production" environment of the "test-repo" repository
