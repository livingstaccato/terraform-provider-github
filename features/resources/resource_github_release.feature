Feature: resource_github_release
  As a user of the Terraform GitHub Provider
  I want to be able to manage a release
  So that I can automate the management of my releases.

  Scenario: Create a release
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_release` with the following attributes:
      | repository       | "test-repo"   |
      | tag_name         | "v1.0.0"      |
      | target_commitish | "main"        |
      | name             | "Version 1.0.0" |
      | body             | "This is the first release." |
      | draft            | false         |
      | prerelease       | false         |
    Then a release with the tag "v1.0.0" should be created in the "test-repo" repository
    And the release should have the name "Version 1.0.0"
    And the release should have the body "This is the first release."
    And the release should not be a draft
    And the release should not be a prerelease

  Scenario: Update a release
    Given I have a GitHub repository named "test-repo"
    And the repository has a release with the tag "v1.0.0"
    When I update the `resource_github_release` with the following attributes:
      | name | "Version 1.0.0 (updated)" |
    Then the release should be updated
    And the release should have the name "Version 1.0.0 (updated)"

  Scenario: Delete a release
    Given I have a GitHub repository named "test-repo"
    And the repository has a release with the tag "v1.0.0"
    When I delete the `resource_github_release` with the tag "v1.0.0"
    Then the release with the tag "v1.0.0" should be deleted from the "test-repo" repository
