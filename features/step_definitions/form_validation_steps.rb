Given(/^I am on the home page$/) do
  home_page.load
end

Given(/^I am not signed in$/) do
  # expect(home_page.navigation_header.account_management.signed_in?).to be_falsey
  expect(home_page.navigation_header.account_management.account_list.text).to include 'Sign in'
end

And(/^I am on the Sign in page$/) do
  expect(sign_in_page).to be_displayed
end


And(/^I select my account from navigation bar$/) do
  home_page.navigation_header.account_management.account_list.click
end

When(/^I enter valid sign in details$/) do
  email = test_data('emails', 'happypath_user')
  puts email
  password = test_data('passwords', 'valid_password')
  puts password
  @first_name = test_data('name', 'happypath_user')
  sign_in_page.sign_in_form.enter_sign_in_details(email, password)
end

And(/^I click sign in button$/) do
  sign_in_page.sign_in_form.click_sign_in_button
end

Then(/^I am successfully signed in$/) do
  expect(home_page.navigation_header.account_management.account_list.text).to include @first_name
end

And(/^I am redirected to Home page$/) do
  expect(home_page).to be_displayed
end

And(/^select Keep me signed in$/) do
  sign_in_page.sign_in_form.checkbox.set true
end

When(/^I try to sign in with not registered email address$/) do
  sign_in_page.sign_in_form.submit(test_data('emails', 'dummy_email'), test_data('passwords', 'valid_password'))
end

When(/^I try to sign in with wrong password$/) do
  sign_in_page.sign_in_form.submit(test_data('emails', 'alternative_happy_user'), test_data('passwords', 'not_matching_password'))
end

Then(/^sign in is not successful$/) do
  expect(sign_in_page).to be_displayed
end

And(/^the following error message is displayed:$/) do |message_text|
  expect(current_page.text).to include(message_text)
end