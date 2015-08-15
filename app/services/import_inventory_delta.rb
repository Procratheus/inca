class ImportInventoryDelta < ImportInventoryShared

  def self.call
    @lastUpdateTime = DateTime.now - 7
    set_variables
    @delta_response = @client.call(:get_inventory_delta, message: { "ser:username": "#{@username}", "ser:password": "#{@password}", "ser:lastUpdateTime": "#{@lastUpdateTime}" })
    @delta_xml_response = Nokogiri::XML(@delta_response.body[:get_inventory_delta_response][:get_inventory_delta_result])
    parse_xml(@delta_xml_response)
  end

end
