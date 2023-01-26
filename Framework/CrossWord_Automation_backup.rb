class CrossWord

  attr_accessor :site

  def initialize()
    @site = SeleniumFrameWork.new()
  end

  def navigate(url)
    site.open_site(url)
    site.maximize_window()
    site.get_title()
  end

  def login()
    site.click_btn("class", "login")
    site.send_text("id", "user_session_email", "testauto653@gmail.com")
    site.send_text("id", "user_session_password", "TestAuto@123")
    site.click_btn("id", "user_session_submit")
    site.sleep_time(2)
  end

  def add_product()
    site.sleep_time(2)
    site.scroll(2)
    site.click_btn("xpath", '//*[@id="content-slot"]/div[5]/div[1]/div/div/div/div/div/div[1]/div/a/span/span[3]/img')
    site.click_btn("xpath", '//*[@id="search-result-items"]/li[1]/div/div[2]/span[4]/form/input[3]')
    site.send_text("id", "search-input", "google")
    site.click_btn('class', 'search-go-container')
    site.click_btn("xpath", '//*[@id="search-result-items"]/li[2]/div/div[2]/span[4]/form/input[3]')
    site.sleep_time(2)
  end

  def add_to_wishlist()
    site.click_btn("class", "home")
    site.scroll(2)
    site.click_btn("xpath", '//*[@id="content-slot"]/div[5]/div[2]/div/div/div/div/div/div[1]/div/a/span/span[3]/img')
    site.click_btn("xpath", '//*[@id="search-result-items"]/li[2]/div/div[1]/a/span/span[3]/img')
    site.click_btn("name", 'commit')
    site.sleep_time(2)
  end

  def move_to_cart_from_wishlist()
    site.click_btn('class', 'my-wishlist')
    site.click_btn('id', 'variant_1341200-16756741068_selected')
    site.click_btn('id', 'move-to-cart')
    site.sleep_time(2)
  end

  def billing_details()
    site.click_btn('id', 'proceed-to-checkout-button')
    site.sleep_time(5)
    site.send_text("id", 'simple_purchase_customer_attributes_mobile', "1234567890")
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
  end

  def close()
    site.close_site()
  end
end

mysite = CrossWord.new()
mysite.navigate("https://www.crossword.in/")
mysite.login()
mysite.add_product()
mysite.add_to_wishlist()
mysite.move_to_cart_from_wishlist()
mysite.billing_details()
mysite.close()
