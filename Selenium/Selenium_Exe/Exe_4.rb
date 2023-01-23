require 'selenium-webdriver'

class Click_CheckBox_RadioButton

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site()
    driver.get("https://demo.automationtesting.in/Register.html")
  end

  def click_radio()
    radio_option = driver.find_element(:css, "input[value='Male']")
    radio_option.click
    sleep(5)
    puts "Radio Clicked"
  end

  def click_checkbox()
    checkbox_option = driver.find_element(:id, "checkbox1")
    checkbox_option.click
    checkbox_option = driver.find_element(:id, "checkbox2")
    checkbox_option.click
    sleep(5)
    puts "CheckBox Checked"
    driver.close();
  end
end

driver_path = "driver//chromedriver.exe"
click_action = Click_CheckBox_RadioButton.new(driver_path)
click_action.open_site()
click_action.click_radio()
click_action.click_checkbox()


