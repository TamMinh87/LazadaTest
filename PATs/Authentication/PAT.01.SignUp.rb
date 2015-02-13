require 'selenium-webdriver'
require 'test/unit' #includes Ruby's test case functionality

Dir[File.dirname(__FILE__) + '/../../Pages/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../../Parms/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../../Utilities/*.rb'].each {|file| require file }
include Utilities
include Parms
include Pages

module PAT
  class SeleniumTest < Test::Unit::TestCase

    def test_signup_with_empty_confirmation_password
      begin
        Global.start("ff")
        HomePage.open_signup_form
        SignUpPage.signup_with_empty_confirmation_password
        assert_equal(true, SignUpPage.error_confirmation_password_displayed?)
      ensure
        Global.stop
      end
    end
  end
end