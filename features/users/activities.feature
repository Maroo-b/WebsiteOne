@vcr
Feature: Activities View
  As a site user
  In order to know how someone has contributed to the community
  I would like to see a users activities feed

  Background:
    Given I am on the "home" page
    And the following users exist
      | first_name | last_name | email                  | skill_list         |
      | Alice      | Jones     | alicejones@hotmail.com | ruby, rails, rspec |
    And the following projects exist:
      | title      | description        | github_url                                  | status | commit_count |
      | WebsiteTwo | awesome autograder | https://github.com/AgileVentures/WebsiteTwo | active | 1            |
    And the following commit_counts exist:
      | project    | user_email             | commit_count |
      | WebsiteTwo | alicejones@hotmail.com | 500          |
    And I am logged in as user with name "Thomas", email "brett@example.com", with password "12345678"

  @javascript
  Scenario: See how commits,hangouts hosted contribute to Karma
    Given I am on "profile" page for user "Alice"
    When I click "Activity"
    Then I should see "WebsiteTwo - 500 commits"
    And I should see "Contributions (GitHub) - 500 total commits x 1 - 500"
    And I should see "Contributions (Hangouts Hosted) - 0 total hangouts x 1 - 0"
    And I should see "Contributions (Authentications) - 1 authentications x 100 - 100"
    And I should see "Contributions (Profile Completeness) - 6 out of 10"
    And I should see "Contributions (Membership Length) - 0 out of 6"
    And I should see "Contributions (Sign In Activity) - 0 out of 6"
