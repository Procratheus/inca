class ImportInventory < ImportInventoryShared

  def self.call
    set_variables
    @response = @client.call(:get_inventory, message: { "ser:username": "#{@username}", "ser:password": "#{@password}"})
    @xml_response = Nokogiri::XML(@response.body[:get_inventory_response][:get_inventory_result])
    parse_xml(@xml_response)
  end

end
