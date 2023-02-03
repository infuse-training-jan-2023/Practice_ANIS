require 'selenium-webdriver'

class DropDownValue

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site(url)
    driver.get(url)
  end

  def dropdown_list_value()

    if driver.find_element(:name, "dropdown").displayed?
      select_tag = driver.find_element(:name, "dropdown")
      options = select_tag.find_elements(:tag_name, "option")

      options.each do |option|
        if option.attribute("text") == "Drop Down Item 4"
          option.click
          return "Value is: " + option.attribute("value")
          sleep(5)
        end
      end
    end
    driver.close();
  end
end

driver_path = "driver//chromedriver.exe"
url = "https://testpages.herokuapp.com/styled/basic-html-form-test.html"
click_action = DropDownValue.new(driver_path)
click_action.open_site(url)
puts click_action.dropdown_list_value()
