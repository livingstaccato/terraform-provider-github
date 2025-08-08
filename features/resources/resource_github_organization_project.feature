Feature: resource_github_organization_project
  As a user of the Terraform GitHub Provider
  I want to be able to manage an organization project
  So that I can automate the management of my projects.

  Scenario: Create an organization project
    Given I have a GitHub organization
    When I define a `resource_github_organization_project` with the following attributes:
      | name | "My Project" |
      | body | "This is my project." |
    Then a project named "My Project" should be created in the organization
    And the project should have the body "This is my project."

  Scenario: Update an organization project
    Given I have a GitHub organization
    And the organization has a project named "My Project"
    When I update the `resource_github_organization_project` with the following attributes:
      | body | "This is my updated project." |
    Then the project "My Project" should be updated
    And the project should have the body "This is my updated project."

  Scenario: Delete an organization project
    Given I have a GitHub organization
    And the organization has a project named "My Project"
    When I delete the `resource_github_organization_project` with the name "My Project"
    Then the project "My Project" should be deleted from the organization
