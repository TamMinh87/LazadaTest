module Utilities
  class Global
    class << self
      def start(browser_name)
        case browser_name
          when "ff"
            $browser = Selenium::WebDriver.for :firefox
          when "ie"
            $browser = Selenium::WebDriver.for :ie
          when "chrome"
            $browser = Selenium::WebDriver.for :chrome
          else
            $browser = Selenium::WebDriver.for :firefox
        end

        $browser.manage.timeouts.implicit_wait = SystemParms.get_implicit_wait
        $browser.manage.timeouts.page_load = SystemParms.get_page_load_time_out
        $wait = Selenium::WebDriver::Wait.new(timeout: SystemParms.get_explicit_wait)
        $browser.manage.window.maximize
      end

      def stop()
        $browser.quit
      end

    end #self
  end #Global
end #Utilities