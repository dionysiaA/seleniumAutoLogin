  @sign_in @sign_out @data_dependent
  Feature: Sign out from Amazon store
  As a signed in user
  I want to sign out from Amazon store
  So that I can prevent unauthorised access to my account

  Background: I am signed in
    Given I am on the home page
    And I have signed in

  @smoke
  Scenario: Sign in and sign out
    When I select sign out from the drop down menu
    Then I should be signed out successfully
    And I am redirected to Sign in page

  Scenario Outline: Sign out from Manage My Account pages
    Given I am on the <tab_name> tab
    When I click Sign out button
    Then I should be signed out successfully
    And I am redirected to Sign in page

  Examples:
    | tab_name         |
    | Personal details |
    | Saved cards      |
    | Order history    |
