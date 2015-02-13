module Parms
  class SignUpParms
    class << self
      def get_first_name
        return FIRST_NAME
      end
      def get_email
        return EMAIL
      end
      def get_password
        return PASSWORD
      end
      private
      FIRST_NAME = "Tam"
      EMAIL = "tam.test01@gmail.com"
      PASSWORD = "Password123"

    end #self
  end #CommonParms
end #Parms