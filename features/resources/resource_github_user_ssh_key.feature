Feature: resource_github_user_ssh_key
  As a user of the Terraform GitHub Provider
  I want to be able to manage an SSH key for my user
  So that I can automate the management of my SSH keys.

  Scenario: Create an SSH key
    Given I am an authenticated user
    When I define a `resource_github_user_ssh_key` with the following attributes:
      | title | "My SSH Key"      |
      | key   | "ssh-rsa AAAA..." |
    Then an SSH key with the title "My SSH Key" should be created for my user
    And the key should have the public key "ssh-rsa AAAA..."

  Scenario: Delete an SSH key
    Given I have an SSH key with the title "My SSH Key"
    When I delete the `resource_github_user_ssh_key` with the title "My SSH Key"
    Then the SSH key "My SSH Key" should be deleted from my user
