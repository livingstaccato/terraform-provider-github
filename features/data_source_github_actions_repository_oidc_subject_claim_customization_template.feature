Feature: data_source_github_actions_repository_oidc_subject_claim_customization_template
  As a user of the Terraform GitHub Provider
  I want to be able to read the OIDC subject claim customization template for a GitHub repository
  So that I can use it in my Terraform configuration.

  Scenario: Read the OIDC subject claim customization template for a GitHub repository
    Given I have a GitHub repository named "test-repo"
    And the repository has an OIDC subject claim customization template with use_default set to false and the following include_claim_keys:
      | "repo" |
      | "ref"  |
    When I define a `data_source_github_actions_repository_oidc_subject_claim_customization_template` resource with the following attributes:
      | name | "test-repo" |
    Then the "use_default" attribute should be false
    And the "include_claim_keys" attribute should be a list of strings
    And the list of strings should contain "repo"
    And the list of strings should contain "ref"
