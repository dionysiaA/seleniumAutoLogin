@sign_in
Feature: Sign into Amazon store
  As a registered user of Amazon store
  I want to sign in
  So that I can access my account, check my account and buy different items

  Background: Navigate to sign in
    Given I am on the home page
    And I am not signed in
    When I select my account from navigation bar

  Scenario: Happy path user sign in
    Given I am on the Sign in page
    When I enter valid sign in details
    And I click sign in button
    Then I am redirected to Home page
    And I am successfully signed in

  Scenario: Sign in by selecting Keep me signed in
    When I enter valid sign in details
    And select Keep me signed in
    And I click sign in button
    Then I am successfully signed in
    And I am redirected to Home page
