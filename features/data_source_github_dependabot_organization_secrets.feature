Feature: data_source_github_dependabot_organization_secrets
  As a user of the Terraform GitHub Provider
  I want to be able to read the secrets for a GitHub organization's dependabot
  So that I can use them in my Terraform configuration.

  Scenario: Read secrets for a GitHub organization's dependabot
    Given I have a GitHub organization
    And the organization has a dependabot secret named "MY_SECRET" with visibility "private"
    When I define a `data_source_github_dependabot_organization_secrets` resource
    Then the "secrets" attribute should be a list of secrets
    And the list of secrets should contain a secret with the following attributes:
      | name       | "MY_SECRET" |
      | visibility | "private"   |
      | created_at | (a string)  |
      | updated_at | (a string)  |
