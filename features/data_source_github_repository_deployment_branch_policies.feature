Feature: data_source_github_repository_deployment_branch_policies
  As a user of the Terraform GitHub Provider
  I want to be able to read the deployment branch policies for a GitHub repository's environment
  So that I can use them in my Terraform configuration.

  Scenario: Read deployment branch policies for a GitHub repository's environment
    Given I have a GitHub repository named "test-repo"
    And the repository has an environment named "production"
    And the environment has a deployment branch policy with the name "main"
    When I define a `data_source_github_repository_deployment_branch_policies` resource with the following attributes:
      | repository       | "test-repo"  |
      | environment_name | "production" |
    Then the "deployment_branch_policies" attribute should be a list of policies
    And the list of policies should contain a policy with the following attributes:
      | name | "main"     |
      | id   | (a string) |
