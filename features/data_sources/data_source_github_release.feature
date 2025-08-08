Feature: data_source_github_release
  As a user of the Terraform GitHub Provider
  I want to be able to read a GitHub release
  So that I can use it in my Terraform configuration.

  Scenario: Read a GitHub release by tag
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has a release with the tag "v1.0.0" and name "Version 1.0.0"
    When I define a `data_source_github_release` resource with the following attributes:
      | repository  | "test-repo" |
      | owner       | "my-org"    |
      | retrieve_by | "tag"       |
      | release_tag | "v1.0.0"    |
    Then the "name" attribute should be "Version 1.0.0"
    And the "release_tag" attribute should be "v1.0.0"
    And the "draft" attribute should be false
    And the "prerelease" attribute should be false
    And the "assets" attribute should be a list of assets
