Feature: data_source_github_ip_ranges
  As a user of the Terraform GitHub Provider
  I want to be able to read the IP ranges for GitHub services
  So that I can use them in my Terraform configuration.

  Scenario: Read IP ranges for GitHub services
    When I define a `data_source_github_ip_ranges` resource
    Then the "hooks" attribute should be a list of strings
    And the "git" attribute should be a list of strings
    And the "web" attribute should be a list of strings
    And the "api" attribute should be a list of strings
    And the "packages" attribute should be a list of strings
    And the "pages" attribute should be a list of strings
    And the "importer" attribute should be a list of strings
    And the "actions" attribute should be a list of strings
    And the "dependabot" attribute should be a list of strings
    And the "hooks_ipv4" attribute should be a list of strings
    And the "git_ipv4" attribute should be a list of strings
    And the "web_ipv4" attribute should be a list of strings
    And the "api_ipv4" attribute should be a list of strings
    And the "packages_ipv4" attribute should be a list of strings
    And the "pages_ipv4" attribute should be a list of strings
    And the "importer_ipv4" attribute should be a list of strings
    And the "actions_ipv4" attribute should be a list of strings
    And the "dependabot_ipv4" attribute should be a list of strings
    And the "hooks_ipv6" attribute should be a list of strings
    And the "git_ipv6" attribute should be a list of strings
    And the "web_ipv6" attribute should be a list of strings
    And the "api_ipv6" attribute should be a list of strings
    And the "packages_ipv6" attribute should be a list of strings
    And the "pages_ipv6" attribute should be a list of strings
    And the "importer_ipv6" attribute should be a list of strings
    And the "actions_ipv6" attribute should be a list of strings
    And the "dependabot_ipv6" attribute should be a list of strings
