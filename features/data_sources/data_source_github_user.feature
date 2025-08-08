Feature: data_source_github_user
  As a user of the Terraform GitHub Provider
  I want to be able to read a GitHub user
  So that I can use their information in my Terraform configuration.

  Scenario: Read a GitHub user
    Given I have a GitHub user with the username "test-user" and name "Test User"
    When I define a `data_source_github_user` resource with the following attributes:
      | username | "test-user" |
    Then the "login" attribute should be "test-user"
    And the "name" attribute should be "Test User"
    And the "avatar_url" attribute should be a string
    And the "gravatar_id" attribute should be a string
    And the "site_admin" attribute should be a boolean
    And the "company" attribute should be a string
    And the "blog" attribute should be a string
    And the "location" attribute should be a string
    And the "email" attribute should be a string
    And the "bio" attribute should be a string
    And the "gpg_keys" attribute should be a list of strings
    And the "ssh_keys" attribute should be a list of strings
    And the "public_repos" attribute should be an integer
    And the "public_gists" attribute should be an integer
    And the "followers" attribute should be an integer
    And the "following" attribute should be an integer
    And the "created_at" attribute should be a string
    And the "updated_at" attribute should be a string
    And the "suspended_at" attribute should be a string
    And the "node_id" attribute should be a string
