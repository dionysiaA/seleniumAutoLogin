@register
Feature: Sign into Amazon store
  As a registered user of Amazon store
  I want to sign in
  So that I can access my account, check my account and buy different items

  Scenario Outline: Sign in with invalid email or password
    Given I am on the home page
    And I am not signed in
    When I select my account from navigation bar
    When I try to sign in with <invalid_credentials>
    Then sign in is not successful
    And the following error message is displayed:
    """
    Important Message! To better protect your account, please re-enter your password and then enter the characters as they are shown in the image below
    """

  Examples:
    | invalid_credentials          |
    | not registered email address |
    | wrong password               |

  Scenario Outline: Sign in with email address of invalid format
    Given I am not signed in
    And I am on the Sign in page
    When I try to sign in with email address of invalid format: <invalid_email>
    Then sign in is not successful
    And the following error message is displayed:
    """
    There was a problem We can not find an account with that email address
    """

  Examples:
    | invalid_email     |
    | no_dot@missingdot |

  Examples:
    | invalid_email                  |
    | only_account_name              |
    | no_email_server_address@       |
    | no_domain@mail.                |
    | @no_account_name.com           |
    | @no_account_name_no_dot        |
    | £$%#@special.chars             |
    | special_chars@_£$%#_domain.com |

  Scenario Outline: Sign in with empty email or password field
    Given I am not signed in
    And I am on the Sign in page
    When I try to sign in with empty <field_name> field
    Then sign in is not successful
    And "<message>" error message is displayed

  Examples:
    | field_name         | message                                                                                         |
    | email              | Enter your email or mobile phone number |
    | password           | Enter your password|
    | email and password | nter your email or mobile phone number Enter your password|