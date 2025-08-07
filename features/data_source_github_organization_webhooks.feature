Feature: data_source_github_organization_webhooks
  As a user of the Terraform GitHub Provider
  I want to be able to read the webhooks for a GitHub organization
  So that I can use them in my Terraform configuration.

  Scenario: Read webhooks for a GitHub organization
    Given I have a GitHub organization
    And the organization has a webhook with the url "https://example.com/webhook"
    When I define a `data_source_github_organization_webhooks` resource
    Then the "webhooks" attribute should be a list of webhooks
    And the list of webhooks should contain a webhook with the following attributes:
      | url    | "https://example.com/webhook" |
      | active | true                        |
      | name   | "web"                         |
      | type   | "Organization"              |
      | id     | (an integer)                |
