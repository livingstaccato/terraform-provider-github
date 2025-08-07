Feature: data_source_github_collaborators
  As a user of the Terraform GitHub Provider
  I want to be able to read the collaborators for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read collaborators for a GitHub repository
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has a collaborator with the login "test-user" and permission "admin"
    When I define a `data_source_github_collaborators` resource with the following attributes:
      | owner      | "my-org"    |
      | repository | "test-repo" |
    Then the "collaborator" attribute should be a list of collaborators
    And the list of collaborators should contain a collaborator with the following attributes:
      | login      | "test-user" |
      | permission | "admin"     |
