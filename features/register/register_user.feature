@register
Feature: Register a new Amazon store user
  As a guest user of Amazon store
  I want to sign up
  So that I can buy and read books

  Background:
    Given I am a guest user

  Scenario: Happy path-register user
    Given I am on the Register page
    When I enter valid personal details
    And I choose a valid password
    And I accept terms and conditions
    And I submit registration details
    Then Registration success page is displayed
    And welcome message is shown

  @negative
  Scenario: Submit registration details with already existing email address
    Given I am on the Register page
    When I enter registration details with already registered email address
    And I submit registration details by accepting terms and conditions
    Then registration is not successful
    And "" message is displayed
    And link to sign in with already registered email address is displayed
    When I click on link to sign in with already registered email
    Then Sign in page is displayed

  @negative
  Scenario: Submit registration details without accepting Amazon store terms and conditions
    Given I am on the Register page
    When I enter valid registration details
    And I submit registration details by not accepting terms and conditions
    Then registration is not successful
    And "" message is displayed

  @negative
  Scenario: Submit registration details when passwords not matching
    Given I am on the Register page
    When I enter valid personal details
    And type passwords that are not matching
    And I submit registration details by accepting terms and conditions
    Then registration is not successful
    And  "" message is displayed

  @negative
  Scenario: Submit registration details with password less than 6 characters
    Given I am on the Register page
    When I enter valid personal details
    And type passwords that are less than 6 characters
    And I submit registration details by accepting terms and conditions
    Then registration is not successful
    And "Your password is too short" message is displayed

  @negative
  Scenario: Submit registration details with empty password
    Given I am on the Register page
    When I enter valid personal details
    But I leave the password field empty
    And I submit registration details by accepting terms and conditions
    Then registration is not successful
    And "Please enter your password" message is displayed
    And "Your passwords don't match, please check and try again" message is displayed
