require 'selenium-webdriver'
require 'test/unit' #includes Ruby's test case functionality

Dir[File.dirname(__FILE__) + '/../Pages/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../Parms/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../Utilities/*.rb'].each {|file| require file }
include Parms
include Pages


module Utilities
  class Route # define some common routes (e.g. add to cart)
    class << self
      def add_random_product_to_cart()
        ProductSearchPage.open_random_product
        ProductDetailPage.add_to_cart

      end

    end
  end
end