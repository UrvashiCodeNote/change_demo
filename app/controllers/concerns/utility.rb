module Utility
    def generate_number     
      @phone_number = rand(7000000000..9999999999).to_i
      return  @phone_number
    end
end