Feature: Provider Configuration
  As a user of the Terraform GitHub Provider
  I want to be able to configure the provider
  So that I can interact with the GitHub API.

  Scenario: Configure the provider with a token
    Given I have a GitHub API token
    When I configure the provider with the token
    Then the provider should be able to authenticate with the GitHub API

  Scenario: Configure the provider with an owner
    Given I have a GitHub organization named "my-org"
    When I configure the provider with the owner "my-org"
    Then the provider should perform operations within the "my-org" organization

  Scenario: Configure the provider with a base URL
    Given I have a GitHub Enterprise Server instance at "https://ghe.example.com"
    When I configure the provider with the base URL "https://ghe.example.com"
    Then the provider should interact with the GitHub Enterprise Server API

  Scenario: Configure the provider with delays and retries
    Given I want to rate limit my API requests
    When I configure the provider with a write delay of 1 second
    And a read delay of 1 second
    And a retry delay of 1 second
    And a max retries of 5
    Then the provider should respect the configured delays and retries
