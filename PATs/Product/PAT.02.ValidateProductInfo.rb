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

        def test_validate_product_info
          begin
            Global.start("ff")

            ProductSearchPage.open_random_product
            product_title_1 = ProductDetailPage.get_product_title
            product_price_1 = ProductDetailPage.get_product_price

            ProductDetailPage.add_to_cart

            product_title_2 = CartDetailPage.get_product_title
            product_price_2 = CartDetailPage.get_product_price

            assert_equal(product_title_1, product_title_2)
            assert_equal(product_price_1, product_price_2)
          ensure
            Global.stop
          end
        end
      end
end