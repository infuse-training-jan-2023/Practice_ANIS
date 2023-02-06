require 'test/unit'
require 'selenium-webdriver'
require_relative 'Selenium_FrameWork'

class Test_TestFrameWork < Test::Unit::TestCase

  def test_make_framework_object
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    assert(create_testframe_instance.instance_of? SeleniumFrameWork)
    driver.close()
  end

  def test_navigate_url
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/abc.html"
    assert_equal("Site Navigated", create_testframe_instance.open_site(url))
    driver.close()
  end

  def test_navigate_invalid_url
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = " "
    assert_equal("Site Not Found", create_testframe_instance.open_site(url))
    driver.close()
  end

  def test_close_driver
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    assert_equal(false, create_testframe_instance.close_site().nil?)
  end

  def test_sleep_time
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    sec = 5
    assert_equal("Sleep Time Invoked", create_testframe_instance.sleep_time(sec))
    driver.close()
  end

  def test_negative_sleep_time
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    sec = 'a'
    assert_equal("Sleep Time not Invoked", create_testframe_instance.sleep_time(sec))
    driver.close()
  end

  def test_explicit_wait_time
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    sec = 5
    assert_equal(false, create_testframe_instance.explicit_wait(sec).nil?)
    driver.close()
  end

  def test_invalid_explicit_wait_time
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    sec = 'a'
    assert_equal(true, create_testframe_instance.explicit_wait(sec).nil?)
    driver.close()
  end

  def test_max_window
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    assert_equal("Window Maximized", create_testframe_instance.maximize_window())
    driver.close()
  end

  def test_get_title
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal("Page Title: Ruby FrameWork Test", create_testframe_instance.get_title())
    driver.close()
  end

  def test_get_negative_title
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_not_equal("Page Title: Test", create_testframe_instance.get_title())
    driver.close()
  end

  def test_find_element
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal(false, create_testframe_instance.findelement("id", "name").nil?)
    driver.close()
  end

  def test_find_invalid_element
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal(nil, create_testframe_instance.findelement("id", "phone"))
    driver.close()
  end

  def test_click_button
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    create_testframe_instance.scroll(1)
    assert_equal("Button Clicked", create_testframe_instance.click_btn("id", "submit"))
    driver.close()
  end

  def test_click_invalid_button
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal("Button not Clicked", create_testframe_instance.click_btn("id", "clear"))
    driver.close()
  end


  def test_send_keys_name
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    name = "Test"
    assert_equal(name, create_testframe_instance.send_text("id", "name", name))
    driver.close()
  end

  def test_send_invalid_name_attribute
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    name = "Test"
    assert_equal("Text not Sent", create_testframe_instance.send_text("iddddddd", "name", name))
    driver.close()
  end

  def test_send_keys_email
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    email = "testauto653@gmail.com"
    assert_equal(email, create_testframe_instance.send_text("id", "email", email))
    driver.close()
  end

  def test_send_invalid_email_attribute
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    email = "testauto653@gmail.com"
    assert_equal("Text not Sent", create_testframe_instance.send_text("class", "email", email))
    driver.close()
  end

  def test_send_keys_password
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    pass = "1234567890"
    assert_equal(pass, create_testframe_instance.send_text("id", "password", pass))
    driver.close()
  end

  def test_send_invalid_password_attribute
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    pass = "1234567890"
    assert_equal("Text not Sent", create_testframe_instance.send_text("css", "password", pass))
    driver.close()
  end

  def test_send_keys_dob
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    dob = "01-01-1999"
    assert_equal(dob, create_testframe_instance.send_text("id", "dob", dob))
    driver.close()
  end

  def test_send_invalid_dob_keys
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    dob = "abcd"
    assert_equal("Text not Sent", create_testframe_instance.send_text("id", "dob", dob))
    driver.close()
  end

  def test_scrolling
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal("Scrolled", create_testframe_instance.scroll(1))
    driver.close()
  end

  def test_invalid_scrolling
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal("Not Scrolled", create_testframe_instance.scroll("a"))
    driver.close()
  end

  def test_select_option
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal("female", create_testframe_instance.select_option("id", "gender", "Female"))
    driver.close()
  end

  def test_select_invalid_option
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal("Gender Not Selected", create_testframe_instance.select_option("id", "gender", 1))
    driver.close()
  end

  def test_send_keys_address
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    address = "Panjim Goa"
    assert_equal(address, create_testframe_instance.send_text("id", "address", address))
    driver.close()
  end

  def test_send_invalid_attribute_address
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    address = "Panjim Goa"
    assert_equal("Text not Sent", create_testframe_instance.send_text("tag", "address", address))
    driver.close()
  end

  def test_get_url
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "file:///src/Test_Framework.html"
    driver.get(url)
    assert_equal("file:///src/Test_Framework.html", create_testframe_instance.get_current_url())
    driver.close()
  end

  def test_get_invalid_url
    driver = SeleniumWebDriver.new.browser_driver()
    create_testframe_instance = SeleniumFrameWork.new(driver)
    url = "Test_Framework"
    create_testframe_instance.open_site(url)
    assert_equal("Current URL not Found", create_testframe_instance.get_current_url())
    driver.close()
  end
end

