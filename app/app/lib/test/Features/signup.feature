Feature: Sign Up Page UI Testing

  Scenario: Verify Sign Up Page UI Elements
    Given I am on the Sign Up page
    Then I should see a "Sign In" text
    And I should see a "Sign Up" text
    And I should see a "Name" text field
    And I should see a "Surname" text field
    And I should see an "Email" text field
    And I should see a "Password" text field
    And I should see a "Next" button

  Scenario: Verify Successful Navigation to Sign In Page
    Given I am on the Sign Up page
    When I tap on the "Sign In" text
    Then I should be navigated to the Sign In page

  Scenario: Verify UI Elements Are Functional
    Given I am on the Sign Up page
    When I enter my name, surname, email, and password
    And I tap on the "Next" button
    Then I should proceed to the next step of sign up process

  Scenario: Verify Password Field Security
    Given I am on the Sign Up page
    When I enter a password
    Then I should see the entered characters masked

  Scenario: Verify Empty Fields Error Handling
    Given I am on the Sign Up page
    When I leave any of the required fields empty
    And I tap on the "Next" button
    Then I should see an error message indicating the empty fields

  Scenario: Verify Invalid Email Format Error Handling
    Given I am on the Sign Up page
    When I enter an invalid email format
    And I tap on the "Next" button
    Then I should see an error message indicating the invalid email format

  Scenario: Verify Password Strength Indicator
    Given I am on the Sign Up page
    When I enter a password
    Then I should see a strength indicator reflecting the password strength

  Scenario: Verify UI Responsiveness
    Given I am on the Sign Up page
    When I resize the screen
    Then I should see all UI elements adjusting accordingly
