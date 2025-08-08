Feature: data_source_github_users
  As a user of the Terraform GitHub Provider
  I want to be able to read multiple GitHub users
  So that I can use their information in my Terraform configuration.

  Scenario: Read multiple GitHub users
    Given I have a GitHub user with the username "test-user-1"
    And I have a GitHub user with the username "test-user-2"
    When I define a `data_source_github_users` resource with the following attributes:
      | usernames | ["test-user-1", "test-user-2"] |
    Then the "logins" attribute should be a list of strings
    And the list of strings should contain "test-user-1"
    And the list of strings should contain "test-user-2"
    And the "emails" attribute should be a list of strings
    And the "node_ids" attribute should be a list of strings
    And the "unknown_logins" attribute should be an empty list of strings

  Scenario: Read multiple GitHub users with some unknown users
    Given I have a GitHub user with the username "test-user-1"
    When I define a `data_source_github_users` resource with the following attributes:
      | usernames | ["test-user-1", "unknown-user"] |
    Then the "logins" attribute should be a list of strings
    And the list of strings should contain "test-user-1"
    And the "unknown_logins" attribute should be a list of strings
    And the list of strings should contain "unknown-user"
