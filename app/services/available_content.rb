module AvailableContent

  class ContentAvailabilty

    def self.call(code)
      available(code)
    end

    def self.available(code)
      if code == "20"
        "Available for Sale"
      elsif code == "40"
        "Withdrawn from Sale"
      elsif code == "46"
        "Withdrawn from Inventory"
      end
    end

  end

end
