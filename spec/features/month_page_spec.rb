require "spec_helper"
require_relative "../../lib/page_objects/month_page"

browsers = [:firefox, :chrome]
browsers.map do |browser_name|

  describe "MonthPage" do
    browser = Watir::Browser.new browser_name
    after(:context) { browser.close }

    MonthPage::MONTHS.each do |month|

      context "#{month.capitalize}'s page" do
        month_page = MonthPage.new(browser: browser, month: month)
        before(:context) { browser.goto(month_page.url) }

        context "when confirming its HTML element quantities" do
          let(:shoes) { month_page.shoe_listings }

          it "should have a blurb element for every shoe on the page" do
            blurbs = month_page.blurbs
            expect(blurbs.length).to eq(shoes.length)
          end

          it "should have a price element for every shoe on the page" do
            prices = month_page.prices
            expect(prices.length).to eq(shoes.length)
          end

          it "should have an image element for every shoe on the page" do
            images = month_page.images
            expect(images.length).to eq(shoes.length)
          end
        end

        context "when rendering its content" do

          it "should have content present for every blurb on the page" do
            blurbs = month_page.blurbs

            blurbs.each do |blurb|
              expect(blurb).to be_present
            end
          end

          it "should have content present for every price on the page" do
            prices = month_page.prices

            prices.each do |price|
              expect(price).to be_present
            end
          end

          it "should have a visible image for every shoe in the list" do
            images = month_page.images

            images.each do |image|
              expect(image).to be_present
            end
          end
        end
      end
    end
  end
end
