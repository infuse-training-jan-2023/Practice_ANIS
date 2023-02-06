require 'selenium-webdriver'
Selenium::WebDriver::Chrome::Service.driver_path = "driver\\chromedriver.exe"
driver = Selenium::WebDriver.for :chrome


driver.get("https://www.google.com/")
search_bar = driver.find_element(name: 'q')

search_bar.send_keys('google')
sleep(5)

search_bar.send_keys(:enter)
