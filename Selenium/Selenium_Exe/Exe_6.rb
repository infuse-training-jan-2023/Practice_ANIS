require 'selenium-webdriver'

class DropDownList

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site()
    driver.get("https://letcode.in/forms")
    driver.manage().window().maximize();
    dropdown_list()
    driver.close();
  end

  def dropdown_list()
    div2 = driver.find_element(:class, 'select')
    select_tag = div2.find_element(:tag_name, "select")
    options = select_tag.find_elements(:tag_name, "option")
    puts options.length
    options.each do |option|
      puts option.text
      if option.text == 'India (+91)'
        option.click
      end
    end

  end

end

driver_path = "driver//chromedriver.exe"

click_action = DropDownList.new(driver_path)

click_action.open_site()

