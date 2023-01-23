require 'selenium-webdriver'
Selenium::WebDriver::Chrome::Service.driver_path = "driver//chromedriver.exe"

class MaximizeWindowScript

  def maximize_window()
    driver = Selenium::WebDriver.for :chrome
    driver.manage().window().maximize();
    sleep(3)
    driver.close()
  end
end

run_maximize_window_script  = MaximizeWindowScript.new()
run_maximize_window_script.maximize_window()



