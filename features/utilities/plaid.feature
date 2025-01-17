Feature: Utilities: Plaid
  In order to support interactions with Financial Institutions
  I want to leverage Plaid within my Space

  @built @unimplemented-steps @milestone-a
  Scenario: Configuring the Plaid Utility
    Given a Space with a Plaid Utility
    When a Space Owner sets the following Configuration for that Utility
      | field        | value                   |
      | client_id    | plaid_sandbox_client_id |
      | plaid_secret | plaid_sandbox_secret    |
      | env          | sandbox                 |
    Then the Plaid Utility is Ready to Use
