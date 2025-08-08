Feature: resource_github_repository_topics
  As a user of the Terraform GitHub Provider
  I want to be able to manage the topics of a GitHub repository
  So that I can automate the management of my repository metadata.

  Scenario: Set the topics for a repository
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_repository_topics` with the following attributes:
      | repository | "test-repo"               |
      | topics     | ["terraform", "github"] |
    Then the repository "test-repo" should have the topics "terraform" and "github"

  Scenario: Update the topics for a repository
    Given I have a GitHub repository named "test-repo"
    And the repository has the topics "terraform" and "github"
    When I update the `resource_github_repository_topics` with the following attributes:
      | topics | ["terraform", "github-provider"] |
    Then the repository "test-repo" should have the topics "terraform" and "github-provider"

  Scenario: Remove all topics from a repository
    Given I have a GitHub repository named "test-repo"
    And the repository has topics
    When I update the `resource_github_repository_topics` with an empty set of topics
    Then the repository "test-repo" should have no topics
