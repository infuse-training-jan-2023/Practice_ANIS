require 'selenium-webdriver'

class SearchEngine

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site(url)
    driver.get(url)
  end

  def search()
    search_bar = driver.find_element(name: 'q')
    search_bar.send_keys('google')
    search_bar.send_keys(:enter)
    driver.close();
  end

end

driver_path = "driver//chromedriver.exe"
url = "https://www.google.com/"
click_action = SearchEngine.new(driver_path)
click_action.open_site(url)
click_action.search()


