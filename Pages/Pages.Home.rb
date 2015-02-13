Dir[File.dirname(__FILE__) + '/../Parms/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../Utilities/*.rb'].each {|file| require file }
include Utilities
include Parms

module Pages
  class HomePage
    class << self
      def open_home_page
        $browser.get CommonParms.get_homepage_url
      end

      def open_signup_form
        $browser.get CommonParms.get_homepage_url
        login_link.click
      end

      private
      def login_link
        Common.find_elements(:css, ".header__navigation__item__text.dropdown__link")[3]
      end


    end #self
  end #HomePage
end #Pages
