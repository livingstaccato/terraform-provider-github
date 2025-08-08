Feature: resource_github_actions_organization_secret_repositories
  As a user of the Terraform GitHub Provider
  I want to be able to manage the repositories that have access to an organization secret
  So that I can automate the management of my secrets.

  Scenario: Set the repositories for an organization secret
    Given I have a GitHub organization
    And the organization has a secret named "MY_SECRET"
    And the organization has a repository with the id 12345
    When I define a `resource_github_actions_organization_secret_repositories` with the following attributes:
      | secret_name             | "MY_SECRET" |
      | selected_repository_ids | [12345]     |
    Then the secret "MY_SECRET" should be accessible by the repository with id 12345

  Scenario: Update the repositories for an organization secret
    Given I have a GitHub organization
    And the organization has a secret named "MY_SECRET"
    And the secret is accessible by the repository with id 12345
    And the organization has a repository with the id 67890
    When I update the `resource_github_actions_organization_secret_repositories` with the following attributes:
      | selected_repository_ids | [12345, 67890] |
    Then the secret "MY_SECRET" should be accessible by the repositories with ids 12345 and 67890

  Scenario: Remove all repositories from an organization secret
    Given I have a GitHub organization
    And the organization has a secret named "MY_SECRET"
    And the secret is accessible by the repository with id 12345
    When I update the `resource_github_actions_organization_secret_repositories` with the following attributes:
      | selected_repository_ids | [] |
    Then the secret "MY_SECRET" should not be accessible by any repositories
