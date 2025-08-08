Feature: resource_github_actions_repository_oidc_subject_claim_customization_template
  As a user of the Terraform GitHub Provider
  I want to be able to manage the OIDC subject claim customization template for a GitHub repository
  So that I can automate the management of my OIDC configuration.

  Scenario: Create an OIDC subject claim customization template
    Given I have a GitHub repository named "test-repo"
    When I define a `resource_github_actions_repository_oidc_subject_claim_customization_template` with the following attributes:
      | repository         | "test-repo"     |
      | use_default        | false           |
      | include_claim_keys | ["repo", "ref"] |
    Then the OIDC subject claim customization template should be created for the repository
    And the template should have the include_claim_keys "repo" and "ref"

  Scenario: Update an OIDC subject claim customization template
    Given I have a GitHub repository named "test-repo"
    And the repository has an OIDC subject claim customization template with the include_claim_keys "repo" and "ref"
    When I update the `resource_github_actions_repository_oidc_subject_claim_customization_template` with the following attributes:
      | include_claim_keys | ["repo", "ref", "actor"] |
    Then the OIDC subject claim customization template should be updated for the repository
    And the template should have the include_claim_keys "repo", "ref", and "actor"

  Scenario: Delete an OIDC subject claim customization template
    Given I have a GitHub repository named "test-repo"
    And the repository has an OIDC subject claim customization template
    When I delete the `resource_github_actions_repository_oidc_subject_claim_customization_template`
    Then the OIDC subject claim customization template should be reset to the default for the repository
