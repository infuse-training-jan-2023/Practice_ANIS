require 'selenium-webdriver'

class ClickButton

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site()
    driver.get("https://goaonline.gov.in")
  end

  def click_button()
    popup_close = driver.find_element(:class, "close-modalSplash")
    popup_close.click
    driver.find_element(:id, "hlkLogin").click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    driver.close();
  end
end

driver_path = "driver//chromedriver.exe"
click_action = ClickButton.new(driver_path)
click_action.open_site()
click_action.click_button()
