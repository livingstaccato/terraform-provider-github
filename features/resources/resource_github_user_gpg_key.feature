Feature: resource_github_user_gpg_key
  As a user of the Terraform GitHub Provider
  I want to be able to manage a GPG key for my user
  So that I can automate the management of my GPG keys.

  Scenario: Create a GPG key
    Given I am an authenticated user
    When I define a `resource_github_user_gpg_key` with the following attributes:
      | armored_public_key | "..." |
    Then a GPG key should be created for my user
    And the key should have the armored public key "..."

  Scenario: Delete a GPG key
    Given I have a GPG key
    When I delete the `resource_github_user_gpg_key`
    Then the GPG key should be deleted from my user
