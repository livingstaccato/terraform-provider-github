Feature: resource_github_repository_autolink_reference
  As a user of the Terraform GitHub Provider
  I want to be able to manage an autolink reference in a GitHub repository
  So that I can automate the management of my links.

  Scenario: Create an autolink reference
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_repository_autolink_reference` with the following attributes:
      | repository          | "test-repo"                               |
      | key_prefix          | "JIRA-"                                   |
      | target_url_template | "https://jira.example.com/browse/<num>" |
      | is_alphanumeric     | true                                      |
    Then an autolink reference with the key prefix "JIRA-" should be created in the "test-repo" repository
    And the autolink reference should have the target url template "https://jira.example.com/browse/<num>"
    And the autolink reference should be alphanumeric

  Scenario: Delete an autolink reference
    Given I have a GitHub repository named "test-repo"
    And the repository has an autolink reference with the key prefix "JIRA-"
    When I delete the `resource_github_repository_autolink_reference` with the key prefix "JIRA-"
    Then the autolink reference with the key prefix "JIRA-" should be deleted from the "test-repo" repository
