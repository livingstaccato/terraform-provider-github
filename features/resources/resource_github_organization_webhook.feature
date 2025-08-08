Feature: resource_github_organization_webhook
  As a user of the Terraform GitHub Provider
  I want to be able to manage a webhook for a GitHub organization
  So that I can automate the management of my webhooks.

  Scenario: Create a webhook
    Given I have a GitHub organization
    When I define a `resource_github_organization_webhook` with the following attributes:
      | events | ["push", "pull_request"] |
      | active | true                     |
    And a "configuration" block with the following attributes:
      | url          | "https://example.com/webhook" |
      | content_type | "json"                        |
      | secret       | "my-secret"                   |
    Then a webhook should be created for the organization
    And the webhook should be active
    And the webhook should be configured to receive "push" and "pull_request" events
    And the webhook should have the url "https://example.com/webhook"

  Scenario: Update a webhook
    Given I have a GitHub organization
    And the organization has a webhook
    When I update the `resource_github_organization_webhook` with the following attributes:
      | active | false |
    Then the webhook should be updated
    And the webhook should be inactive

  Scenario: Delete a webhook
    Given I have a GitHub organization
    And the organization has a webhook
    When I delete the `resource_github_organization_webhook`
    Then the webhook should be deleted from the organization
