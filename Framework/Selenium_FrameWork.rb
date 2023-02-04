require 'selenium-webdriver'

class SeleniumFrameWork

  attr_accessor :driver

  def initialize()
    chrome_driver()
  end

  def chrome_driver()
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--window-size=1920,1080")
    options.add_argument("--disable-gpu")
    options.add_argument("--disable-dev-shm-usage")
    Selenium::WebDriver::Chrome::Service.driver_path = "/opt/chromedriver-109.0.5414.74/chromedriver"
    @driver = Selenium::WebDriver.for :chrome, options: options
  end

  def open_site(url)
    begin
      driver.get(url)
      return "Site Navigated"
    rescue => exception
      puts exception.message
      return "Site Not Found"
    end
  end

  def verify(actual_val, expected_val)
    find = driver.find_element(actual_val)
    return find.text.include?(expected_val)
  end

  def close_site()
    driver.close()
    return "Diver Closed"
  end

  def sleep_time(sec)
    begin
      sleep(sec)
      return "Sleep Time Invoked"
    rescue => exception
      puts exception.message
      return "Sleep Time not Invoked"
    end
  end

  def explicit_wait(sec)
    if sec.is_a? Integer
      return Selenium::WebDriver::Wait.new(:timeout => sec) # seconds
    else
      return nil
    end
  end

  def maximize_window()
    begin
      driver.manage().window().maximize()
      return "Window Maximized"
    rescue => exception
      puts exception.message
      return "Window not Maximized"
    end
  end

  def get_title()
    begin
      page_title = driver.title
      return "Page Title: " + page_title
    rescue => exception
      puts exception.message
      return "No title found"
    end
  end

  def findelement(element, value)
    begin
      element_value = driver.find_element(:"#{element}", value)
      return element_value
    rescue => exception
      puts exception.message
      return nil
    end
  end

  def click_element(element)
    element.click
  end

  def click_btn(element, value)
    begin
      click_evnt = findelement(element, value)
      puts click_evnt
      click_evnt.click
      return "Button Clicked"
    rescue => exception
      puts exception.message
      return "Button not Clicked"
    end
  end

  def verify(actual_val, expected_val)
    find = driver.find_element(actual_val)
    return find.text.include?(expected_val)
  end

  def send_text(element, value, text)
    begin
      send = findelement(element, value)
      send.send_keys(text)
      send.attribute('value')
      if send.attribute('value').empty?
        return "Text not Sent"
      end
      return send.attribute('value')
    rescue => exception
      puts exception.message
      return "Text not Sent"
    end
  end

  def get_text(element, value)
    begin
      gettext = findelement(element, value)
      puts gettext.text
      if gettext.text.empty?
        return "Text not found"
      end
      return gettext.text
    rescue => exception
      puts exception.message
      return "Text not found"
    end
  end

  def scroll(scoll_by)
    begin
      driver.execute_script("window.scrollTo(0, 200*#{scoll_by})")
      return "Scrolled"
    rescue => exception
      puts exception.message
      return "Not Scrolled"
    end
  end

  def select_option(element, value, text)
    begin
      select_element = findelement(element, value)
      select = Selenium::WebDriver::Support::Select.new(select_element)
      select.select_by(:text, "#{text}")
      return select_element.attribute('value')
    rescue => exception
      puts exception.message
      return "Gender Not Selected"
    end
  end

  def get_current_url()
    begin
      if driver.current_url.include? "data:,"
        return "Current URL not Found"
      end
      return driver.current_url
    rescue => exception
      puts exception.message
      return "Current URL not Found"
    end
  end
end
