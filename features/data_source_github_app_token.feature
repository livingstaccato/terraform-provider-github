Feature: data_source_github_app_token
  As a user of the Terraform GitHub Provider
  I want to be able to generate an installation token for a GitHub App
  So that I can use it to authenticate with the GitHub API.

  Scenario: Generate an installation token for a GitHub App
    Given I have a GitHub App with the app_id "12345"
    And I have an installation of the app with the installation_id "54321"
    And I have a PEM file with the contents "-----BEGIN RSA PRIVATE KEY-----\n..."
    When I define a `data_source_github_app_token` resource with the following attributes:
      | app_id          | "12345"                                           |
      | installation_id | "54321"                                           |
      | pem_file        | "-----BEGIN RSA PRIVATE KEY-----\n..."              |
    Then the "token" attribute should be a string
