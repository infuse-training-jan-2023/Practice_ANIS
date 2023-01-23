require 'selenium-webdriver'

class AutomationTesting
  attr_accessor :driver

  def initialize(path)
    Selenium::WebDriver::Chrome::Service.driver_path = path
    @driver = Selenium::WebDriver.for :chrome
  end

  def open_and_close_site()
    driver.get("https://www.patanjaliayurved.net/")
    driver.manage().window().maximize()
    sign_in()
    select_products()
    login()
    add_mob_no()
    driver.close()
  end

  def sign_in()
    register_btn = driver.find_element(:class, 'lang-title')
    register_btn.click
    select_title = driver.find_element(name:'title')
    title_options = select_title.find_elements(tag_name:'option')
    title_options.each do |option|
      if option.text == 'Mr'
        option.click
      end
    end
    first_name = driver.find_element(id:'firstname')
    first_name.send_keys("Test")
    last_name = driver.find_element(id:'lastname')
    last_name.send_keys("Auto")
    mob_no = driver.find_element(id:'mobile')
    mob_no.send_keys("1234567890")
    email_field = driver.find_element(id:'email')
    email_field.send_keys("ygaofnugf@emltmp.com")
    pass = driver.find_element(:id, 'password')
    pass.send_keys('TestAuto@123')
    cpass = driver.find_element(:id, 'confirmpassword')
    cpass.send_keys('TestAuto@123')
    logo = driver.find_element(:class, 'header-logo')
    logo.click
  end

  def select_products()
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
   begin
      product1_select = wait.until{driver.find_element(:id, 'btn-add-cart3475')}
      driver.action.key_down(product1_select, :page_down).perform
      sleep(2)
   rescue => exception
      puts exception
   end
    home_btn = driver.find_element(:class, 'navbar-brand')
    home_btn.click
    sleep(2)
    product2_select = driver.find_element(:id, 'btn-add-cart3505')
    driver.action.key_up(product2_select, :page_down).perform
    product3_select = driver.find_element(:id, 'btn-add-cart3479')
    driver.action.key_down(:up).perform
    driver.action.key_up(product3_select, :enter).perform
    sleep(1)
    product3_cart = driver.find_element(:id, 'btn-add-cart3479')
    product3_cart.click
    cart = driver.find_element(:xpath, '//*[@id="container-fixed"]/div/div[3]')
    cart.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    begin
      checkout_btn = wait.until {driver.find_element(:xpath, '//*[@id="container-fixed"]/div/div[3]/div/div/div/div[2]/a')}
      checkout_btn.click
      driver.action.key_up(:page_down).perform
      next_btn = wait.until{driver.find_element(:xpath, '/html/body/section/div/div/a')}
      next_btn.click
    rescue => exception
      puts exception
    end
    sleep(2)
  end

  def login()
    google_login = driver.find_element(:xpath, '//*[@id="login-form"]/div/a[1]/img')
    google_login.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    begin
      email_field = wait.until {driver.find_element(:id, 'identifierId')}
      email_field.send_keys('testauto653@gmail.com')
      email_next = driver.find_element(:id, 'identifierNext')
      email_next.click
    rescue => exception
      puts exception
    end
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    begin
      pass = wait.until {driver.find_element(:name, 'password')}
      pass.send_keys('TestAuto@123')
      pass_next = driver.find_element(:id, 'passwordNext')
      pass_next.click
    rescue => exception
      puts exception
    end

  end

  def add_mob_no()
    wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    begin
      mob_number = wait.until {driver.find_element(:name, 'mobile_number')}
      mob_number.send_keys('1234567890')
      submit_btn =driver.find_element(:xpath, '//*[@id="form_mobile"]/div/div/div[3]/button')
      submit_btn.click
      sleep(5)
    rescue => exception
      puts exception
    end
  end
end

driver_path = "driver//chromedriver.exe"
click_action = AutomationTesting.new(driver_path)
click_action.open_and_close_site()





