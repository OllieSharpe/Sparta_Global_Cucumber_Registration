require 'Capybara/dsl'

class BbcSignInPage
  include Capybara::DSL

  SIGN_IN_PAGE_URL = 'https://www.bbc.co.uk/signin'


  def visit_registration_page
    visit(SIGN_IN_PAGE_URL)
  end

  def current_url
    page.current_url
  end

  def click_register_now
    find('a[class="link link--primary"]').click
  end

end
