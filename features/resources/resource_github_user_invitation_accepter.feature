Feature: resource_github_user_invitation_accepter
  As a user of the Terraform GitHub Provider
  I want to be able to accept a user invitation
  So that I can automate the management of my invitations.

  Scenario: Accept a user invitation
    Given I have a user invitation with the id "INVITATION_ID"
    When I define a `resource_github_user_invitation_accepter` with the following attributes:
      | invitation_id | "INVITATION_ID" |
    Then the invitation "INVITATION_ID" should be accepted

  Scenario: Skip accepting a user invitation when the id is empty
    Given I have a user invitation with an empty id
    When I define a `resource_github_user_invitation_accepter` with the following attributes:
      | allow_empty_id | true |
    Then no invitation should be accepted
