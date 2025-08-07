Feature: data_source_github_repository
  As a user of the Terraform GitHub Provider
  I want to be able to read a GitHub repository
  So that I can use it in my Terraform configuration.

  Scenario: Read a GitHub repository
    Given I have a GitHub repository named "test-repo" owned by "my-org"
    And the repository has the description "My Test Repo"
    When I define a `data_source_github_repository` resource with the following attributes:
      | full_name | "my-org/test-repo" |
    Then the "name" attribute should be "test-repo"
    And the "description" attribute should be "My Test Repo"
    And the "private" attribute should be a boolean
    And the "visibility" attribute should be a string
    And the "has_issues" attribute should be a boolean
    And the "has_discussions" attribute should be a boolean
    And the "has_projects" attribute should be a boolean
    And the "has_downloads" attribute should be a boolean
    And the "has_wiki" attribute should be a boolean
    And the "is_template" attribute should be a boolean
    And the "fork" attribute should be a boolean
    And the "allow_merge_commit" attribute should be a boolean
    And the "allow_squash_merge" attribute should be a boolean
    And the "allow_rebase_merge" attribute should be a boolean
    And the "allow_auto_merge" attribute should be a boolean
    And the "allow_update_branch" attribute should be a boolean
    And the "default_branch" attribute should be a string
    And the "primary_language" attribute should be a string
    And the "archived" attribute should be a boolean
    And the "repository_license" attribute should be a list of maps
    And the "pages" attribute should be a list of maps
    And the "topics" attribute should be a list of strings
    And the "html_url" attribute should be a string
    And the "ssh_clone_url" attribute should be a string
    And the "svn_url" attribute should be a string
    And the "git_clone_url" attribute should be a string
    And the "http_clone_url" attribute should be a string
    And the "template" attribute should be a list of maps
    And the "node_id" attribute should be a string
    And the "repo_id" attribute should be an integer
    And the "delete_branch_on_merge" attribute should be a boolean
