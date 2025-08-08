Feature: data_source_github_tree
  As a user of the Terraform GitHub Provider
  I want to be able to read a git tree
  So that I can use it in my Terraform configuration.

  Scenario: Read a git tree
    Given I have a GitHub repository named "test-repo"
    And the repository has a tree with the sha "TREE_SHA"
    And the tree contains a file named "README.md"
    When I define a `data_source_github_tree` resource with the following attributes:
      | repository | "test-repo" |
      | tree_sha   | "TREE_SHA"  |
    Then the "entries" attribute should be a list of entries
    And the list of entries should contain an entry with the following attributes:
      | path | "README.md" |
      | type | "blob"      |
