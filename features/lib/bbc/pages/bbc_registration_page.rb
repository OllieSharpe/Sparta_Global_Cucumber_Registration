require 'Capybara/dsl'

class BbcRegistrationPage
  include Capybara::DSL

  DAY_ID = 'day-input'
  MONTH_ID = 'month-input'
  YEAR_ID = 'year-input'
  SUBMIT_BUTTON_ID = '#submit-button'
  EMAIL_ID = 'user-identifier-input'
  PASSWORD_ID = 'password-input'
  POSTCODE_ID = 'postcode-input'
  GENDER_ID = 'gender-input'
  PASSWORD_ERROR_ID = '#form-message-password'

  def visit_registration_page
    visit(REGISTRATION_PAGE_URL)
  end

  def current_url
    page.current_url
  end

  def click_over_13
    find('a[aria-label="13 or over"]').click
  end

  def enter_dob
    fill_in(DAY_ID, :with => '21')
    fill_in(MONTH_ID, :with => '10')
    fill_in(YEAR_ID, :with => '1987')
  end

  def click_submit
    find(SUBMIT_BUTTON_ID).click
  end

  def enter_email
    fill_in(EMAIL_ID, :with => 'mr.dark@yahoo.com')
  end

  def enter_password(password)
    fill_in(PASSWORD_ID, :with => "#{password}")
  end

  def enter_postcode
    fill_in(POSTCODE_ID, :with => 'DE45 1RW')
  end

  def input_gender
    select('Male', :from => GENDER_ID)
  end

  def opt_out
    find('label[for="optOut"]').click
  end

  def retrieve_error_message
    find(PASSWORD_ERROR_ID).text
  end

end
