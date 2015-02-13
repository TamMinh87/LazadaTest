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

        def test_change_quantity
          begin
            Global.start("ff")

            #3.1 validate subtotal price when user changes quantity
            ProductDetailPage.go_to_product_detail_page
            ProductDetailPage.add_to_cart

            quantity_number = "2"
            CartDetailPage.change_quantity(quantity_number)
            CartDetailPage.wait_for_update_quantity(quantity_number)
            price = Common.convert_price(CartDetailPage.get_product_price)
            sub_total_price =  Common.convert_price(CartDetailPage.get_product_sub_total_price)
            assert_equal(sub_total_price.to_i, quantity_number.to_i * price.to_i)

            #3.2 add 2 random product
            Route.add_random_product_to_cart
            Route.add_random_product_to_cart

            #3.3 from cart popup, change quantity of any product
            CartDetailPage.change_quantity(1, quantity_number)
          ensure
            Global.stop
          end
        end
      end
end