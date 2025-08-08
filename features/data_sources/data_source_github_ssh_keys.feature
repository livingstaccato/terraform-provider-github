Feature: data_source_github_ssh_keys
  As a user of the Terraform GitHub Provider
  I want to be able to read the public SSH keys for GitHub
  So that I can use them in my Terraform configuration.

  Scenario: Read the public SSH keys for GitHub
    When I define a `data_source_github_ssh_keys` resource
    Then the "keys" attribute should be a list of strings
