require "selenium-webdriver"
require "#{File.dirname(__FILE__)}/Global.rb"

module Utilities
  class Common
    class << self
      def find_element(how, what)
          $wait.until { $browser.find_element(how, what).displayed? }
          $browser.find_element(how, what)
      end

      def find_elements(how, what)
        $wait.until { $browser.find_elements(how, what)[0].displayed? }
        $browser.find_elements(how, what)
      end

      def select_text(element, value)
        option = Selenium::WebDriver::Support::Select.new(element)
        option.select_by(:text, value)
      end

      def convert_price(price)
        price.gsub('.', '').strip.split(" ")[0]
        #remove_vnd.gsub(/\s/,'')
      end
    end
  end
end