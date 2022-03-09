require 'rubygems'
require 'selenium-webdriver'

opt = {
  excludeSwitches: ['enable-logging'],
  args: ['window-size=1024,768', '--no-sandbox']
}
caps = Selenium::WebDriver::Chrome::Options.new(options: opt)
driver = Selenium::WebDriver.for(:chrome, capabilities: caps)
driver.get("http://qa-web-test-task.s3-website.eu-central-1.amazonaws.com")

driver.find_element(:link_text, "Начать проверку").click
for i in 2..10000
  if driver.find_element(xpath: "//a[contains(text(), 'Next') or contains(text(), 'Ещё ссылка') or contains(text(), 'И ещё одна') ]") then
    driver.find_element(xpath: "//a[@href='#{i}.html']").click
    next
  end
  puts "Cсылки нет на странице #{i}"
end

driver.quit
