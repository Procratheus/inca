class Api::InventoryImportsController < ApiController

  def import_all
    Content.transaction do 
      @bulk_contents = ImportInventory.call
    end

    if @bulk_contents
      flash[:success] = "The bulk inventory update was successfull."
      redirect_to publishers_path
    else
      flash[:error] = "The bulk inventory update failed. Please try again."
      redirect_to publishers_path
    end
  end

  def import_delta
    Content.transaction do
      @delta_contents = ImportInventoryDelta.call
    end

    if @delta_contents
      flash[:success] = "The bulk inventory update was successfull."
      redirect_to publishers_path
    else
      flash[:error] = "The bulk inventory update failed. Please try again."
      redirect_to publishers_path
    end
  end
    
  def import_image_all
    Content.transaction do
      @contents = Content.all
      @contents.each do |content| 
        content.get_image  
      end
    end

    if @contents
      flash[:success] = "The bulk inventory update was successfull."
      redirect_to publishers_path
    else
      flash[:error] = "The bulk inventory update failed. Please try again."
      redirect_to publishers_path
    end
  end

end