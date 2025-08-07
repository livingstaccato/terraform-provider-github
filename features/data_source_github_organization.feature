Feature: data_source_github_organization
  As a user of the Terraform GitHub Provider
  I want to be able to read the information about a GitHub organization
  So that I can use it in my Terraform configuration.

  Scenario: Read information about a GitHub organization
    Given I have a GitHub organization named "my-org"
    And the organization has the description "My Org Description"
    When I define a `data_source_github_organization` resource with the following attributes:
      | name | "my-org" |
    Then the "login" attribute should be "my-org"
    And the "description" attribute should be "My Org Description"
    And the "plan" attribute should be a string
    And the "repositories" attribute should be a list of strings
    And the "members" attribute should be a list of strings
    And the "users" attribute should be a list of maps
    And the "default_repository_permission" attribute should be a string
    And the "members_can_create_repositories" attribute should be a boolean
    And the "two_factor_requirement_enabled" attribute should be a boolean
    And the "members_allowed_repository_creation_type" attribute should be a string
    And the "members_can_create_public_repositories" attribute should be a boolean
    And the "members_can_create_private_repositories" attribute should be a boolean
    And the "members_can_create_internal_repositories" attribute should be a boolean
    And the "members_can_create_pages" attribute should be a boolean
    And the "members_can_create_public_pages" attribute should be a boolean
    And the "members_can_create_private_pages" attribute should be a boolean
    And the "members_can_fork_private_repositories" attribute should be a boolean
    And the "web_commit_signoff_required" attribute should be a boolean
    And the "advanced_security_enabled_for_new_repositories" attribute should be a boolean
    And the "dependabot_alerts_enabled_for_new_repositories" attribute should be a boolean
    And the "dependabot_security_updates_enabled_for_new_repositories" attribute should be a boolean
    And the "dependency_graph_enabled_for_new_repositories" attribute should be a boolean
    And the "secret_scanning_enabled_for_new_repositories" attribute should be a boolean
    And the "secret_scanning_push_protection_enabled_for_new_repositories" attribute should be a boolean
