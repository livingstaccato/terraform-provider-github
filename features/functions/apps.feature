Feature: GitHub App Authentication
  As a user of the Terraform GitHub Provider
  I want to be able to authenticate as a GitHub App
  So that I can perform operations on behalf of the App.

  Scenario: Generate an OAuth token from a GitHub App
    Given I have a GitHub App with an ID, installation ID, and PEM file
    When I call the function to generate an OAuth token
    Then I should receive a valid OAuth token
    And the token should be usable to authenticate with the GitHub API
