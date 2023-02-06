require 'selenium-webdriver'

class GetTableColumn
  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site(url)
    driver.get(url)
  end

  def get_table_column(cols)
    table = driver.find_element(:class, 'zebra-striped')
    tbody = table.find_element(:tag_name, 'tbody')
    tr = tbody.find_elements(:tag_name, 'tr')
    td = tr[0].find_elements(:tag_name, 'td')
    thead = table.find_element(:tag_name, 'thead')
    th = thead.find_elements(:tag_name, 'th')
    puts th[cols].text
    tr.each{|row|
      puts row.find_elements(:tag_name, "td")[cols].text
    }

    driver.close()
  end
end

driver_path = "driver//chromedriver.exe"
url = "https://computer-database.gatling.io/computers"
click_action = GetTableColumn.new(driver_path)
click_action.open_site(url)
click_action.get_table_column(0)
