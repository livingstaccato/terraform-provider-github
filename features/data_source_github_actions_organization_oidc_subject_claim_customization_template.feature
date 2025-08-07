Feature: data_source_github_actions_organization_oidc_subject_claim_customization_template
  As a user of the Terraform GitHub Provider
  I want to be able to read the OIDC subject claim customization template for a GitHub organization
  So that I can use it in my Terraform configuration.

  Scenario: Read the OIDC subject claim customization template for a GitHub organization
    Given I have a GitHub organization
    And the organization has an OIDC subject claim customization template with the following include_claim_keys:
      | "repo" |
      | "ref"  |
    When I define a `data_source_github_actions_organization_oidc_subject_claim_customization_template` resource
    Then the "include_claim_keys" attribute should be a list of strings
    And the list of strings should contain "repo"
    And the list of strings should contain "ref"
