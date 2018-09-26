require 'selenium-webdriver'
require 'pp'

def wait_key_input(driver)
  puts '-----------------------------------'
  puts 'waiting ... please enter your selenium script.'
  script = gets
  puts "\n"
  puts "[You Enterd]\n"
  puts "#{script.chomp}\n"
  puts "\n"
  puts "[Execution result]\n"
  eval(script.chomp)
end

ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36"
#ブラウザ立ち上げモード
caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {args: ["--user-agent=#{ua}", 'window-size=1280x800']})
#ヘッドレスモード
#caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {args: ["--headless","--no-sandbox", "--disable-setuid-sandbox", "--disable-gpu", "--user-agent=#{ua}", 'window-size=1280x800']})
driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps

puts 'waiting ... please enter your selenium script. exp) driver.navigate.to "https://example.com" '
puts 'selenium object is "driver". if you want to exit, please enter just "exit".'
loop do
  begin
    wait_key_input(driver)
  rescue => e
    puts '=== Ruby ERROR OCCURRED ==='
    pp e.message
    pp e.backtrace
  end
end

driver.quit
