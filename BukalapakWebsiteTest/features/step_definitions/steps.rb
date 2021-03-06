require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for :chrome
link = "https://www.bukalapak.com/"
email = "indahtrivena312@gmail.com"
password = "indahtriv008"
wrongPassword = "indahtriv"
Given("Open Bukalapak") do
  driver.navigate.to link
end

Then("Go To Register Page") do
  driver.find_element(:xpath, '//*[@id="vm__white-header-dweb"]/section/header/div[3]/div/div/div[2]/div/a[1]').click

  driver.find_element(:xpath, '/html/body/main/div/div[2]/section/div[1]/div[1]/div/input').send_keys email
  driver.find_element(:xpath, '/html/body/main/div/div[2]/section/div[2]/button').click
  sleep(5)
  driver.find_element(:xpath, '//*[@id="TFAJS-1629884816598"]/section/div/div[2]/div/div[2]/div/div/div/div/button[1]').click
  sleep(5)
  driver.find_element(:xpath, '/html/body/main/div/div[2]/section/div[6]/div[2]/div/a').click
end
Then("Compare URL") do
  urlNya = driver.current_url
  puts urlNya
  expect(urlNya).to eq("https://accounts.bukalapak.com/login?comeback=https%3A%2F%2Fwww.bukalapak.com%2F")
end

Then("Go To Login Page") do
  driver.find_element(:xpath, '//*[@id="vm__white-header-dweb"]/section/header/div[3]/div/div/div[2]/div/a[2]/p').click
  driver.find_element(:xpath, '//*[@id="user_identity_textfield"]').send_keys email
  sleep(2)
  driver.find_element(:xpath, '//*[@id="submit_button"]').click
  sleep(2)

end
Then ("Input True Password") do
  driver.find_element(:xpath, '//*[@id="input-password"]').send_keys password
  driver.find_element(:xpath, '//*[@id="btn-login"]').click
  sleep(3)
end

Then ("Input Wrong Password") do
  driver.find_element(:xpath, '//*[@id="input-password"]').send_keys wrongPassword
  driver.find_element(:xpath, '//*[@id="btn-login"]').click
  sleep(3)
end

Then("Compare After Login") do
  urlNya = driver.current_url
  puts urlNya
  expect(urlNya).to eq("https://www.bukalapak.com/?flash=you_login")
end

Then("Compare Failed Login") do
  urlNya = driver.current_url
  puts urlNya
  expect(urlNya).to eq("https://accounts.bukalapak.com/login")
end

Then("Go To Search") do

  driver.find_element(:xpath, '//*[@id="v-omnisearch__input"]').send_keys 'iphone 8 64gb second fulset'
  driver.find_element(:xpath, '//*[@id="v-omnisearch"]/button').click
end

Then("I Add To Cart") do

  driver.find_element(:xpath, '//*[@id="product-explorer-container"]/div/div[1]/div[2]/div/div[2]/div[3]/div/div[1]/div/div/div[2]/div[1]/p/a').click
  driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[3]/div[1]/div[2]/div[1]/div[2]/span').click
  driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[3]/div[1]/div[2]/div/div[3]/ul/li[1]').click
  driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[3]/div[2]/div[2]/div/div[2]/span').click
  driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[3]/div[2]/div[2]/div/div[3]/ul/li[4]').click

  driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[6]/div/button[2]').click
  sleep(3)
  driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[6]/div[2]/div/div/div/div[3]/div/div[2]/button').click

  # dropdown = driver.find_element(:xpath,'//*[@id="section-main-product"]/div[2]/div[3]/div[1]/div[2]/div/div[2]')
  # option = dropdown.find_elements(tag_name: 'option')
  # option.each { |option| option.click if option.text == '64GB' }
  #
  # dropdown = driver.find_element(:xpath,'//*[@id="section-main-product"]/div[2]/div[3]/div[2]/div[2]/div/div[2]')
  # option = dropdown.find_elements(tag_name: 'option')
  # option.each { |option| option.click if option.text == 'Gold' }
  #
  # driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[6]/div/button[2]').click
  # driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[6]/div[2]/div/div/div/div[3]/div/div[2]/button').click
end

Then("Compare After Search") do
  urlNya = driver.current_url
  expect(urlNya) ==   ("https://www.bukalapak.com/c/handphone?from=omnisearch&from_keyword_history=false&search%5Bkeywords%5D=iphone%208%2064gb%20second%20fullset&search_source=omnisearch_category&source=navbar")
end

Then("Compare After Cart") do
  urlNya = driver.current_url
  puts urlNya
  expect(urlNya).to eq("https://www.bukalapak.com/cart/carts?from=dweb_cart_popup")
end

