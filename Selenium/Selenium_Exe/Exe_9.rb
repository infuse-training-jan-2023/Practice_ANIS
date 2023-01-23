require 'selenium-webdriver'

class GetTableHeader
  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site()
    driver.get("https://cosmocode.io/automation-practice-webtable/")
  end

  def get_table_headers()
    count_td = driver.find_elements(:xpath, "//table[@id='countries']/tbody/tr[1]//td").length
    for i in 1..count_td
      convt_i = i.to_s
      value = driver.find_element(:xpath, "//table[@id='countries']/tbody/tr[1]/td["+convt_i+"]/h3/strong").text
      puts "Header" + convt_i + ": " + value
    end
    driver.close()
  end
end

driver_path = "driver//chromedriver.exe"
click_action = GetTableHeader.new(driver_path)
click_action.open_site()
click_action.get_table_headers()
