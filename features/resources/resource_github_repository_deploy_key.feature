Feature: resource_github_repository_deploy_key
  As a user of the Terraform GitHub Provider
  I want to be able to manage a deploy key for a GitHub repository
  So that I can automate the management of my deploy keys.

  Scenario: Create a deploy key
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_repository_deploy_key` with the following attributes:
      | repository | "test-repo"       |
      | title      | "My Deploy Key"   |
      | key        | "ssh-rsa AAAA..." |
      | read_only  | true              |
    Then a deploy key with the title "My Deploy Key" should be created in the "test-repo" repository
    And the deploy key should be read-only

  Scenario: Delete a deploy key
    Given I have a GitHub repository named "test-repo"
    And the repository has a deploy key with the title "My Deploy Key"
    When I delete the `resource_github_repository_deploy_key` with the title "My Deploy Key"
    Then the deploy key "My Deploy Key" should be deleted from the "test-repo" repository
