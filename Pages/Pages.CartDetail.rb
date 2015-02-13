Dir[File.dirname(__FILE__) + '/../Parms/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../Utilities/*.rb'].each {|file| require file }
include Utilities
include Parms

module Pages
  class CartDetailPage
    class << self

      def get_product_title(index = 0)
        product_title[index].text
      end

      def get_product_price(index = 0)
        product_price[index/4].text
      end

      def get_product_sub_total_price(index = 0)
        product_sub_total_price[index].text
      end

      def change_quantity(index = 0, value)
        Common.select_text(product_quantity[index], value)
      end

      def wait_for_update_quantity(number)
        $wait.until { cart_intro.text.include? number }
      end

      private
      def product_title
        Common.find_elements(:class, "productdescription")
      end

      def product_price
        Common.find_elements(:css, ".width_15.price.center span")
      end

      def product_quantity
        Common.find_elements(:css, ".cart-product-item-cell-qty-select")
      end

      def cart_intro
        Common.find_element(:class, "cartintro")
      end

      def product_sub_total_price
        Common.find_elements(:css, ".width_20.price")
      end

    end #self
  end #CartPage
end #Pages
