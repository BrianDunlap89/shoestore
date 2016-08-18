require 'watir-webdriver'

class MonthPage

  attr_reader :browser, :month

  MONTHS = [
    "january",
    "february",
    "march",
    "april",
    "may",
    "june",
    "july",
    "august",
    "september",
    "october",
    "november",
    "december"
  ]

  def initialize(browser:, month:)
    @browser = browser
    @month = month
  end

  def url
    "http://shoestore-manheim.rhcloud.com/months/#{month}"
  end

  def shoe_listings
    browser.divs(class: "shoe_result")
  end

  def blurbs
    browser.tds(class: "shoe_description")
  end

  def prices
    browser.tds(class: "shoe_price")
  end

  def images
    browser.tds(class: "shoe_image").map(&:img)
  end
end
