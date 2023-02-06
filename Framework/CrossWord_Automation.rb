require_relative 'Selenium_FrameWork'

def main

  url = "https://www.crossword.in/"
  email = "testauto653@gmail.com"
  pass = "TestAuto@123"

  expected_login = "Hello TestAuto"
  logged_xpath = {:xpath=> '//*[@id="hd"]/div/div/div/div[1]/div/div[2]/div[1]/a[2]'}

  site = SeleniumFrameWork.new()

  site.open_site(url)
  site.maximize_window()
  site.get_title()
  puts "Site Navigated Successfully"

  site.click_btn("class", "login")
  site.send_text("id", "user_session_email",email )
  site.send_text("id", "user_session_password", pass)
  site.click_btn("id", "user_session_submit")
  site.sleep_time(2)
  site.verify(logged_xpath, expected_login)
  puts "Logged in Successfully"


  site.sleep_time(2)
  site.scroll(2)
  wait = site.explicit_wait(2)
  element = wait.until{site.findelement("xpath", '//*[@id="content-slot"]/div[5]/div[1]/div/div/div/div/div/div[1]/div/a/span/span[3]/img')}
  site.click_element(element)
  # site.click_btn("xpath", '//*[@id="content-slot"]/div[5]/div[1]/div/div/div/div/div/div[1]/div/a/span/span[3]/img')
  site.click_btn("xpath", '//*[@id="search-result-items"]/li[1]/div/div[2]/span[4]/form/input[3]')
  site.send_text("id", "search-input", "google")
  site.click_btn('class', 'search-go-container')
  site.click_btn("xpath", '//*[@id="search-result-items"]/li[2]/div/div[2]/span[4]/form/input[3]')
  site.sleep_time(2)
  puts "Added Product to card"

  wait = site.explicit_wait(2)
  element = wait.until{site.findelement("class", "home")}
  site.click_element(element)
  # site.click_btn("class", "home")
  site.scroll(2)
  site.click_btn("xpath", '//*[@id="content-slot"]/div[5]/div[2]/div/div/div/div/div/div[1]/div/a/span/span[3]/img')
  site.click_btn("xpath", '//*[@id="search-result-items"]/li[2]/div/div[1]/a/span/span[3]/img')
  site.click_btn("name", 'commit')
  site.sleep_time(2)
  puts "Product added to Wishlist"

  wait = site.explicit_wait(2)
  element = wait.until{site.findelement('class', 'my-wishlist')}
  site.click_element(element)
  # site.click_btn('class', 'my-wishlist')
  site.sleep_time(2)
  site.click_btn('id', 'variant_1341200-16756741068_selected')
  site.click_btn('id', 'move-to-cart')
  site.sleep_time(2)
  puts "Moved Wishlist Item to Cart"

  wait = site.explicit_wait(2)
  element = wait.until{site.findelement('id', 'proceed-to-checkout-button')}
  site.click_element(element)
  # site.click_btn('id', 'proceed-to-checkout-button')
  site.sleep_time(5)
  site.send_text("id", "simple_purchase_order_items_attributes_0_gift_message", "Enjoy Your Birthday, And Very Happy BirthDay.")
  site.scroll(3)
  site.send_text("id", "simple_purchase_shipping_address_attributes_name", "Test")
  site.send_text("id", "simple_purchase_shipping_address_attributes_address", "Panjim Goa")
  site.sleep_time(10)
  site.select_option("class", "state_select", "Goa")
  site.send_text("id", "simple_purchase_shipping_address_attributes_city", "Panjim")
  site.send_text("id", "simple_purchase_shipping_address_attributes_zip", "403206")
  site.send_text("id", "simple_purchase_shipping_address_attributes_mobile", "1234567890")
  site.click_btn("class", "button")
  site.sleep_time(10)
  puts "Billing Details Entered"

  site.close_site()
end

main()
