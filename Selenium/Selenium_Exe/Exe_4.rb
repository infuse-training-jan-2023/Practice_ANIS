require 'selenium-webdriver'

class Click_CheckBox_RadioButton

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site(url)
    driver.get(url)
  end

  def click_radio()
    radio_option = driver.find_elements(:name, "radiooptions")
    radio_option.each do |values|
      if values.attribute("value") == "FeMale"
        values.click
      end
    end
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
url = "https://demo.automationtesting.in/Register.html"
click_action = Click_CheckBox_RadioButton.new(driver_path)
click_action.open_site(url)
click_action.click_radio()
# click_action.click_checkbox()


