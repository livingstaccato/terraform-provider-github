Feature: data_source_github_repository_autolink_references
  As a user of the Terraform GitHub Provider
  I want to be able to read the autolink references for a GitHub repository
  So that I can use them in my Terraform configuration.

  Scenario: Read autolink references for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has an autolink reference with the key prefix "JIRA-" and target url template "https://jira.example.com/browse/<num>"
    When I define a `data_source_github_repository_autolink_references` resource with the following attributes:
      | repository | "test-repo" |
    Then the "autolink_references" attribute should be a list of autolink references
    And the list of autolink references should contain an autolink reference with the following attributes:
      | key_prefix          | "JIRA-"                             |
      | target_url_template | "https://jira.example.com/browse/<num>" |
      | is_alphanumeric     | false                               |
