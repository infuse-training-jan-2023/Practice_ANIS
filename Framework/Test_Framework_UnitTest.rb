require 'test/unit'
require_relative 'Selenium_FrameWork'

class Test_TestFrameWork < Test::Unit::TestCase

  def test_make_framework_object
    create_testframe_instance = SeleniumFrameWork.new()
    assert(create_testframe_instance.instance_of? SeleniumFrameWork)
    create_testframe_instance.close_site()
  end

  def test_navigate_url
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/abc.html"
    assert_equal("Site Navigated", create_testframe_instance.open_site(url))
    create_testframe_instance.close_site()
  end

  def test_navigate_invalid_url
    create_testframe_instance = SeleniumFrameWork.new()
    url = " "
    assert_equal("Site Not Found", create_testframe_instance.open_site(url))
    create_testframe_instance.close_site()
  end

  def test_close_driver
    create_testframe_instance = SeleniumFrameWork.new()
    assert_equal(false, create_testframe_instance.close_site().nil?)
  end

  def test_sleep_time
    create_testframe_instance = SeleniumFrameWork.new()
    sec = 5
    assert_equal("Sleep Time Invoked", create_testframe_instance.sleep_time(sec))
    create_testframe_instance.close_site()
  end

  def test_negative_sleep_time
    create_testframe_instance = SeleniumFrameWork.new()
    sec = 'a'
    assert_equal("Sleep Time not Invoked", create_testframe_instance.sleep_time(sec))
    create_testframe_instance.close_site()
  end

  def test_explicit_wait_time
    create_testframe_instance = SeleniumFrameWork.new()
    sec = 5
    assert_equal(false, create_testframe_instance.explicit_wait(sec).nil?)
    create_testframe_instance.close_site()
  end

  def test_invalid_explicit_wait_time
    create_testframe_instance = SeleniumFrameWork.new()
    sec = 'a'
    assert_equal(true, create_testframe_instance.explicit_wait(sec).nil?)
    create_testframe_instance.close_site()
  end

  def test_max_window
    create_testframe_instance = SeleniumFrameWork.new()
    assert_equal("Window Maximized", create_testframe_instance.maximize_window())
    create_testframe_instance.close_site()
  end

  def test_get_title
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal("Page Title: Ruby FrameWork Test", create_testframe_instance.get_title())
    create_testframe_instance.close_site()
  end

  def test_get_negative_title
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_not_equal("Page Title: Test", create_testframe_instance.get_title())
    create_testframe_instance.close_site()
  end

  def test_find_element
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal(false, create_testframe_instance.findelement("id", "name").nil?)
    create_testframe_instance.close_site()
  end

  def test_find_invalid_element
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal(nil, create_testframe_instance.findelement("id", "phone"))
    create_testframe_instance.close_site()
  end

  def test_click_button
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    create_testframe_instance.scroll(1)
    assert_equal("Button Clicked", create_testframe_instance.click_btn("id", "submit"))
    create_testframe_instance.close_site()
  end

  def test_click_invalid_button
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal("Button not Clicked", create_testframe_instance.click_btn("id", "clear"))
    create_testframe_instance.close_site()
  end


  def test_send_keys_name
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    name = "Test"
    assert_equal(name, create_testframe_instance.send_text("id", "name", name))
    create_testframe_instance.close_site()
  end

  def test_send_invalid_name_attribute
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    name = "Test"
    assert_equal("Text not Sent", create_testframe_instance.send_text("iddddddd", "name", name))
    create_testframe_instance.close_site()
  end

  def test_send_keys_email
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    email = "testauto653@gmail.com"
    assert_equal(email, create_testframe_instance.send_text("id", "email", email))
    create_testframe_instance.close_site()
  end

  def test_send_invalid_email_attribute
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    email = "testauto653@gmail.com"
    assert_equal("Text not Sent", create_testframe_instance.send_text("class", "email", email))
    create_testframe_instance.close_site()
  end

  def test_send_keys_password
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    pass = "1234567890"
    assert_equal(pass, create_testframe_instance.send_text("id", "password", pass))
    create_testframe_instance.close_site()
  end

  def test_send_invalid_password_attribute
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    pass = "1234567890"
    assert_equal("Text not Sent", create_testframe_instance.send_text("css", "password", pass))
    create_testframe_instance.close_site()
  end

  def test_send_keys_dob
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    dob = "01-01-1999"
    assert_equal(dob, create_testframe_instance.send_text("id", "dob", dob))
    create_testframe_instance.close_site()
  end

  def test_send_invalid_dob_keys
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    dob = "abcd"
    assert_equal("Text not Sent", create_testframe_instance.send_text("id", "dob", dob))
    create_testframe_instance.close_site()
  end

  def test_scrolling
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal("Scrolled", create_testframe_instance.scroll(1))
    create_testframe_instance.close_site()
  end

  def test_invalid_scrolling
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal("Not Scrolled", create_testframe_instance.scroll("a"))
    create_testframe_instance.close_site()
  end

  def test_select_option
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal("female", create_testframe_instance.select_option("id", "gender", "Female"))
    create_testframe_instance.close_site()
  end

  def test_select_invalid_option
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal("Gender Not Selected", create_testframe_instance.select_option("id", "gender", 1))
    create_testframe_instance.close_site()
  end

  def test_send_keys_address
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    address = "Panjim Goa"
    assert_equal(address, create_testframe_instance.send_text("id", "address", address))
    create_testframe_instance.close_site()
  end

  def test_send_invalid_attribute_address
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    address = "Panjim Goa"
    assert_equal("Text not Sent", create_testframe_instance.send_text("tag", "address", address))
    create_testframe_instance.close_site()
  end

  def test_get_url
    create_testframe_instance = SeleniumFrameWork.new()
    url = "file:///src/Test_Framework.html"
    create_testframe_instance.open_site(url)
    assert_equal("file:///src/Test_Framework.html", create_testframe_instance.get_current_url())
    create_testframe_instance.close_site()
  end

  def test_get_invalid_url
    create_testframe_instance = SeleniumFrameWork.new()
    url = "Test_Framework"
    create_testframe_instance.open_site(url)
    assert_equal("Current URL not Found", create_testframe_instance.get_current_url())
    create_testframe_instance.close_site()
  end
end

