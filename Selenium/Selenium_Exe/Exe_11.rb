require 'selenium-webdriver'

class GetCellValue
  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site(url)
    driver.get(url)
  end

  def get_cell_value(row)
    table = driver.find_element(:id, 'table1')
    tbody = table.find_element(:tag_name, 'tbody')
    tr = tbody.find_elements(:tag_name, 'tr')
    td = tr[row].find_elements(:tag_name, 'td')
    td.each{ |td|
      puts td.text
    }
    driver.close()
  end

end

driver_path = "driver//chromedriver.exe"
url = "https://the-internet.herokuapp.com/tables"
click_action = GetCellValue.new(driver_path)
click_action.open_site(url)
row = 0
click_action.get_cell_value(row)

