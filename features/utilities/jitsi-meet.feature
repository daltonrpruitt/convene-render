Feature: Utilities: Jitsi Meet
  In order to support audio/video calls
  I want to leverage Jitsi Meet in my Space

  # @see: https://jaas.8x8.vc

  @unstarted @milestone-a
  Scenario: Configuring the Jitsi Meet Utility
    Given a Space with a Jitsi Meet Utility
    When a Space Owner sets the following Configuration for that Utility
      | field              | value                              |
      | url                | https://jitsi-meet.example.com     |
      | application_id     | this-is-provided-by-jitsi-meet     |
      | application_secret | secret-key-used-to-generate-tokens |
    Then the Jitsi Meet Utility is Ready For Use
