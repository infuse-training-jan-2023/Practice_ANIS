require 'selenium-webdriver'

class GetSiteTitle

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def get_title()
    driver.get("https://google.com")
    return 'Page title: ' + driver.title
    driver.close();
  end
end

driver_path = "driver//chromedriver.exe"
site_title = GetSiteTitle.new(driver_path)
puts site_title.get_title()
