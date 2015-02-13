Dir[File.dirname(__FILE__) + '/../Parms/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../Utilities/*.rb'].each {|file| require file }
include Utilities
include Parms

module Pages
  class ProductDetailPage
    class << self

      def go_to_product_detail_page
        $browser.get CommonParms.get_product_detail_url
      end

      def get_product_title
        product_title.text
      end

      def get_product_price
        product_price.text
      end

      def add_to_cart
        add_to_cart_button.click
      end

      private
      def product_title
        Common.find_element(:id, "prod_title")
      end

      def product_price
        Common.find_element(:id, "special_price_box")
      end

      def add_to_cart_button
        Common.find_element(:id, "AddToCart")
      end


    end #self
  end #ProductDetailPage
end #Pages
