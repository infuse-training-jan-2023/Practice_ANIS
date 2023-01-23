require 'selenium-webdriver'

class MoveSliders

  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_site()
    driver.get("https://www.globalsqa.com/demo-site/sliders/#Steps")
    driver.manage.window().maximize()
    horizontal_slider()
    driver.close();
  end

  def horizontal_slider()
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    begin
      iframe = wait.until{driver.find_element(:css,'iframe.lazyloaded')}
      driver.switch_to.frame(iframe)
    rescue => exception
      puts exception
    end
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    begin
      slider = wait.until{driver.find_element(:tag_name,'span')}
      driver.action.key_down(:control).perform
      driver.action.drag_and_drop_by(slider, 100, 150).perform
      puts "drag success"
    rescue => exception
      puts exception
    end
  end
end

driver_path = "driver//chromedriver.exe"
click_action = MoveSliders.new(driver_path)
click_action.open_site()




