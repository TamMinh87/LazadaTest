module Parms
  class CommonParms
    class << self
      def get_homepage_url
        return HOME_PAGE_URL
      end
      def get_product_detail_url
        return PRODUCT_DETAIL
      end

      private
      BASE_URL = "http://www.lazada.vn"
      HOME_PAGE_URL = BASE_URL + "/"
      PRODUCT_DETAIL = "http://www.lazada.vn/tai-nghe-chup-tai-kem-mic-ovann-x3-xanh-287752.html"

    end #self
  end #CommonParms
end #Parms