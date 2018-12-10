Given("I am on the BBC home page") do
  bbc_homepage.visit_homepage
end

Given("I move to the sign in page") do
  bbc_homepage.click_sign_in_link
end

When("I proceed to register") do
  bbc_sign_in_page.click_register_now
end

When("I select I am over 13") do
  bbc_registration_page.click_over_13
end

When("I input my DOB") do
  bbc_registration_page.enter_dob
  bbc_registration_page.click_submit
end

When(/^I input the necessary details with the password details (.*)$/) do |password|
  bbc_registration_page.enter_email
  bbc_registration_page.enter_password(password)
  bbc_registration_page.enter_postcode
  bbc_registration_page.input_gender
  bbc_registration_page.opt_out
  bbc_registration_page.click_submit
end

Then(/^I receive the corresponding error (.*)$/) do |error|
  expect(bbc_registration_page.retrieve_error_message).to eq error
end
