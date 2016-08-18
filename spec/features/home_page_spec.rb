require 'spec_helper'
require_relative "../../lib/page_objects/home_page"

browsers = [:firefox, :chrome]
browsers.map do |browser_name|

  describe "HomePage" do
    browser = Watir::Browser.new browser_name
    home_page = HomePage.new(browser: browser)

    before { browser.goto(home_page.url) }
    after(:context) { browser.close }

    context "when users want to subscribe" do
      let(:email) { "user@example.com" }
      let(:flash_notice_text) { "Thanks! We will notify you of our new shoes at this email: #{email}" }

      it "should have a field for users to submit their email address" do
        expect(home_page.subscription_field).to be_present
      end

      it "flashes a confirmation once users successfully submit their email address" do
        home_page.enter_email(address: email)
        home_page.submit_email

        expect(home_page.flash_notice).to be_present
      end

      it "flashes the correct confirmation message" do
        home_page.enter_email(address: email)
        home_page.submit_email

        expect(home_page.flash_text).to eq(flash_notice_text)
      end
    end
  end
end