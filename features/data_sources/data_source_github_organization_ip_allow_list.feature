Feature: data_source_github_organization_ip_allow_list
  As a user of the Terraform GitHub Provider
  I want to be able to read the IP allow list for a GitHub organization
  So that I can use it in my Terraform configuration.

  Scenario: Read the IP allow list for a GitHub organization
    Given I have a GitHub organization
    And the organization has an IP allow list entry with the name "My IP" and value "192.168.1.1/32"
    When I define a `data_source_github_organization_ip_allow_list` resource
    Then the "ip_allow_list" attribute should be a list of IP allow list entries
    And the list of IP allow list entries should contain an entry with the following attributes:
      | name             | "My IP"           |
      | allow_list_value | "192.168.1.1/32"  |
      | is_active        | true              |
      | created_at       | (a string)        |
      | updated_at       | (a string)        |
