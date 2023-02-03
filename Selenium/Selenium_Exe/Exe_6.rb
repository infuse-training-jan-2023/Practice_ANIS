require 'selenium-webdriver'

class DropDownList

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site(url)
    driver.get(url)
    driver.manage().window().maximize();
    dropdown_list()
    driver.close();
  end

  def dropdown_list()
    select_element = driver.find_element(:tag_name, "select")
    select = Selenium::WebDriver::Support::Select.new(select_element)
    options = select_element.find_elements(:tag_name, "option")
    options.each do |all_options|
      puts all_options.text
    end
    sleep(5)

  end

end

driver_path = "driver//chromedriver.exe"
url = "https://letcode.in/forms"
click_action = DropDownList.new(driver_path)
click_action.open_site(url)

