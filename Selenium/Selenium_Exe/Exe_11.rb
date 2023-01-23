require 'selenium-webdriver'

class GetCellValue
  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site()
    driver.get("https://the-internet.herokuapp.com/tables")
  end

  def get_cell_value(row, col)
    table = driver.find_element(:id, 'table1')
    tbody = table.find_element(:tag_name, 'tbody')
    tr = tbody.find_elements(:tag_name, 'tr')
    td = tr[row].find_elements(:tag_name, 'td')
    value = []
    td.each{ |td|
      value.push(td.text)
    }
    puts value[col]
    driver.close()
  end

end

driver_path = "driver//chromedriver.exe"
click_action = GetCellValue.new(driver_path)
click_action.open_site()
row = 0
column = 1
click_action.get_cell_value(row, column)

