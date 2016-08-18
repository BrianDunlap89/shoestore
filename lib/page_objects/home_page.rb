require 'watir-webdriver'

class HomePage

  attr_reader :browser

  def initialize(browser:)
    @browser = browser
  end

  def url
    "http://shoestore-manheim.rhcloud.com/"
  end

  def enter_email(address:)
    subscription_field.set address
  end

  def submit_email
    subscription_submit_button.click
  end

  def subscription_field
    browser.text_field(id: "remind_email_input")
  end

  def subscription_submit_button
    browser.div(class: "left").inputs.last
  end

  def flash_notice
    browser.div(class: "flash notice")
  end

  def flash_text
    flash_notice.text
  end
end
