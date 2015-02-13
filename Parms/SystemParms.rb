module Parms
  class SystemParms
    class << self
      def get_default_browser
        return BROWSER_NAME
      end

      def get_implicit_wait
        return IMPLICIT_WAIT
      end

      def get_page_load_time_out
        return PAGE_LOAD
      end

      def get_explicit_wait
        return EXPLICIT_WAIT
      end

      private
      BROWSER_NAME = "ff"
      IMPLICIT_WAIT = 10
      PAGE_LOAD = 60
      EXPLICIT_WAIT = 30
    end #self
  end #CommonParms
end #Parms