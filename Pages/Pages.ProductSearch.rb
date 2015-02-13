Dir[File.dirname(__FILE__) + '/../Parms/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../Utilities/*.rb'].each {|file| require file }
include Utilities
include Parms

module Pages
  class ProductSearchPage
    class << self
       def open_random_product()
        $browser.get CommonParms.get_homepage_url
        popular_search_tag[random_search_tag_index].click
        search_result[random_search_result_index].click
      end

      private
      def popular_search_tag
        Common.find_elements(:css, ".header .header__brands .header__brands__item a")
      end

      def search_result
        Common.find_elements(:class, "product-card__name")
      end

      def random_search_tag_index
        last_index = popular_search_tag.count - 2 - 1 # -2 because 2 last search tags do not display on site
        Random.rand(1...last_index) # index start from 1 because first item is not a product
      end

       def random_search_result_index
         last_index = search_result.count - 1
         Random.rand(0...last_index)
       end

    end #self
  end #ProductSearchPage
end #Pages
