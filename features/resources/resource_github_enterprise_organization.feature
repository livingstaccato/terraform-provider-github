Feature: resource_github_enterprise_organization
  As a user of the Terraform GitHub Provider
  I want to be able to manage an organization in a GitHub enterprise
  So that I can automate the management of my organizations.

  Scenario: Create an organization in an enterprise
    Given I have a GitHub enterprise with the id "ENTERPRISE_ID"
    When I define a `resource_github_enterprise_organization` with the following attributes:
      | enterprise_id | "ENTERPRISE_ID" |
      | name          | "my-org"        |
      | display_name  | "My Org"        |
      | description   | "My Org Description" |
      | admin_logins  | ["admin-user"]  |
      | billing_email | "billing@example.com" |
    Then the organization "my-org" should be created in the enterprise
    And the organization should have the display name "My Org"
    And the organization should have the description "My Org Description"
    And the organization should have the admin "admin-user"
    And the organization should have the billing email "billing@example.com"

  Scenario: Update an organization in an enterprise
    Given I have a GitHub enterprise with the id "ENTERPRISE_ID"
    And the enterprise has an organization named "my-org"
    When I update the `resource_github_enterprise_organization` with the following attributes:
      | description | "My New Org Description" |
    Then the organization "my-org" should be updated
    And the organization should have the description "My New Org Description"

  Scenario: Delete an organization in an enterprise
    Given I have a GitHub enterprise with the id "ENTERPRISE_ID"
    And the enterprise has an organization named "my-org"
    When I delete the `resource_github_enterprise_organization` for the organization "my-org"
    Then the organization "my-org" should be deleted from the enterprise
