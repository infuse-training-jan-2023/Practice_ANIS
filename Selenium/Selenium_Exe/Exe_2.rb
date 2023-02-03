require 'selenium-webdriver'

class GetSiteTitle

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def get_title(url)
    driver.get(url)
    return 'Page title: ' + driver.title
    driver.close();
  end
end

driver_path = "driver//chromedriver.exe"
url = "https://google.com"
site_title = GetSiteTitle.new(driver_path)
puts site_title.get_title(url)
