require 'selenium-webdriver'

class GetTableColumn
  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site()
    driver.get("https://computer-database.gatling.io/computers")
  end

  def get_table_column()
    count_td = driver.find_elements(:xpath, "//table[contains(@class,'comp')]/tbody/tr[2]//td").length
    value = driver.find_element(:xpath, "//table[contains(@class,'comp')]/tbody/tr[2]//td[1]").text
    puts "Column " + value

    driver.close()

    # for i in 1..count_td
    #   convt_i = i.to_s
    #   value = driver.find_element(:xpath, "//table[contains(@class,'comp')]/tbody/tr[2]//td["+convt_i+"]").text
    #   puts "Columns" + convt_i + ": " + value
    # end
    # driver.close()
  end
end

driver_path = "driver//chromedriver.exe"
click_action = GetTableColumn.new(driver_path)
click_action.open_site()
click_action.get_table_column()
