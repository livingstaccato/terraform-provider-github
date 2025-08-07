Feature: data_source_github_rest_api
  As a user of the Terraform GitHub Provider
  I want to be able to make a GET request to the GitHub REST API
  So that I can use the response in my Terraform configuration.

  Scenario: Make a GET request to the GitHub REST API
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    When I define a `data_source_github_rest_api` resource with the following attributes:
      | endpoint | "/repos/my-org/test-repo" |
    Then the "code" attribute should be 200
    And the "status" attribute should be "200 OK"
    And the "headers" attribute should be a string
    And the "body" attribute should be a string
    And the body should contain the following attributes:
      | name      | "test-repo"          |
      | full_name | "my-org/test-repo" |
