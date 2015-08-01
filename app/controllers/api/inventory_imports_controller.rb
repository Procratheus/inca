class Api::InventoryImportsController < ApiController

  def import_all
    
    @contents = Content.parse_hash
  end

  def import_delta
    parse_hash(get_inventory_delta)
  end
    
end