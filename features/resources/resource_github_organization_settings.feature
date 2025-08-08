Feature: resource_github_organization_settings
  As a user of the Terraform GitHub Provider
  I want to be able to manage the settings of a GitHub organization
  So that I can automate the management of my organization.

  Scenario: Set the settings for an organization
    Given I have a GitHub organization
    When I define a `resource_github_organization_settings` with the following attributes:
      | billing_email | "billing@example.com" |
      | company       | "My Company"          |
      | email         | "hello@example.com"   |
      | name          | "My Org"              |
      | description   | "My Org Description"  |
    Then the settings for the organization should be updated
    And the billing email should be "billing@example.com"
    And the company should be "My Company"
    And the email should be "hello@example.com"
    And the name should be "My Org"
    And the description should be "My Org Description"

  Scenario: Update the settings for an organization
    Given I have a GitHub organization
    And the organization has settings configured
    When I update the `resource_github_organization_settings` with the following attributes:
      | blog | "https://example.com/blog" |
    Then the settings for the organization should be updated
    And the blog should be "https://example.com/blog"

  Scenario: Delete the settings for an organization
    Given I have a GitHub organization
    And the organization has settings configured
    When I delete the `resource_github_organization_settings`
    Then the settings for the organization should be reset to the default values
