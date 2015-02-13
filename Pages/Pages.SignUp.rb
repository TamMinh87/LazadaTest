Dir[File.dirname(__FILE__) + '/../Parms/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../Utilities/*.rb'].each {|file| require file }
include Utilities
include Parms

module Pages
  class SignUpPage
    class << self
      def open
        $browser.get CommonParms.get_homepage_url
      end

      def signup_with_empty_confirmation_password
        signup_tab.click
        first_name_field.send_keys(SignUpParms.get_first_name)
        email_field.send_keys(SignUpParms.get_email)
        password_field.send_keys(SignUpParms.get_password)
        send_button.click
      end

      def error_confirmation_password_displayed?
        confirmation_password_error_field.displayed?
      end
      
      private
      def signup_tab
        Common.find_elements(:class, "option-label")[1]
      end

      def first_name_field
        Common.find_element(:id, "RegistrationForm_first_name")
      end

      def email_field
        Common.find_element(:id, "RegistrationForm_email")
      end

      def password_field
        Common.find_element(:id, "RegistrationForm_password")
      end

      def confirmation_password_field
        Common.find_element(:id, "RegistrationForm_password2")
      end

      def send_button
        Common.find_element(:id, "send")
      end

      def confirmation_password_error_field
        confirmation_password_field.find_element(:xpath, "..").find_element(:css, ".error-password")
      end

    end #self
  end #SignUpPage
end #Pages
