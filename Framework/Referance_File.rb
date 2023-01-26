require 'selenium-webdriver'
require_relative 'Selenium_FrameWork'
Selenium::WebDriver::Chrome::Service.driver_path = "driver/chromedriver.exe"
driver = Selenium::WebDriver.for :chrome


# test = SeleniumFrameWork.new()



driver.get("https://www.crossword.in/login")
driver.manage().window().maximize()
user = driver.find_element("id", "user_session_email")
user.send_keys("testauto653@gmail.com")
pas = driver.find_element("id", "user_session_password")
pas.send_keys("TestAuto@123")
driver.find_element(:id, 'user_session_submit').click
sleep(2)
puts driver.find_element(:class, 'login-msg').text
# driver.find_element(:xpath, '//*[@id="hd"]/div/div/div/div[1]/div/div[2]/div[1]/a[4]').click
# sleep(2)
# driver.find_element('id', 'proceed-to-checkout-button').click
# sleep(5)
# mob = driver.find_element('id', 'simple_purchase_customer_attributes_mobile')
# mob.send_keys("1234567890")
# sleep(10)
# driver.close()


# driver.get("https://www.crossword.in/")
# driver.find_element(:class)
# span = driver.findelement("tag_name", "span")
# puts span.getText()
# sleep(5)
# # test.press_enter()

# docker run anis/docker_unit_test

# docker build --target test -t anis/docker_unit_test .
# docker run anis/docker_unit_test

# docker build --target run -t anis/docker_run .
# docker run anis/docker_run


# Referance

# driver.find_element(:class, "login").click
# driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
# driver.execute_script("window.scrollTo({
#   top: 500,
#   left: 100,
#   behavior: 'smooth'
# })")


# select_element = driver.find_element(:id, "simple_purchase_shipping_address_attributes_country")
# select = Selenium::WebDriver::Support::Select.new(select_element)
# select.select_by(:text, "United States")
