require 'rubygems'
require 'selenium-webdriver'

opt = {
  excludeSwitches: ['enable-logging'],
  args: ['window-size=1024,768', '--no-sandbox']
}
caps = Selenium::WebDriver::Chrome::Options.new(options: opt)
driver = Selenium::WebDriver.for(:chrome, capabilities: caps)
driver.get("http://qa-web-test-task.s3-website.eu-central-1.amazonaws.com")

i = 0
while driver.find_element(:link_text, "Next") || driver.find_element(:link_text, "Другой текст") || driver.find_element(:link_text, "Еще текст")  do
  if driver.find_element(:link_text, "Next")
    i += 1
    driver.find_element(:link_text, "Next").click
  elsif driver.find_element(:link_text, "Другой текст")
    i += 1
    driver.find_element(:link_text, "Другой текст").click
  elsif driver.find_element(:link_text, "Еще текст")
    i += 1
    driver.find_element(:link_text, "Еще текст").click
  else
    raise "Cсылки нет на странице #{i}!"
  end
end
driver.quit
