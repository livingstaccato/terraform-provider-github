Feature: Provider
  As a user of the Terraform GitHub Provider
  I want to be able to configure the provider
  So that I can interact with the GitHub API.

  Scenario: Authenticate with a token
    Given I have a GitHub API token
    When I configure the provider with the token
    Then the provider should be able to authenticate with the GitHub API

  Scenario: Authenticate with a GitHub App
    Given I have a GitHub App with an ID, installation ID, and PEM file
    When I configure the provider with the App's credentials
    Then the provider should be able to authenticate with the GitHub API as the App

  Scenario: Configure the provider for a specific organization
    Given I have a GitHub organization named "my-org"
    When I configure the provider with the owner "my-org"
    Then the provider should perform operations within the "my-org" organization

  Scenario: Configure the provider to use a GitHub Enterprise Server instance
    Given I have a GitHub Enterprise Server instance at "https://ghe.example.com"
    When I configure the provider with the base URL "https://ghe.example.com"
    Then the provider should interact with the GitHub Enterprise Server API

  Scenario: Configure the provider to retry failed requests
    Given I want to retry failed requests
    When I configure the provider with a max retries of 5
    And a retry delay of 2 seconds
    Then the provider should retry failed requests up to 5 times with a 2 second delay
