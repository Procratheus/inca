class Api::InventoryImportsController < ApiController

  def import_all
    Content.transaction do
      @bulk_contents = ImportInventory.call
      @bulk_contents.each do |content|
        ImportImages.call(content)
      end
    end
    authorize @bulk_contents
    if @bulk_contents
      flash[:success] = "The inventory update was successfull."
      redirect_to publishers_path
    else
      flash[:error] = "The inventory update failed. Please try again."
      redirect_to publishers_path
    end
  end

  def import_delta
    Content.transaction do
      @delta_contents = ImportInventoryDelta.call
      @delta_contents.each do |content|
        ImportImages.call(content)
      end
    end
    authorize @delta_contents
    if @delta_contents
      flash[:success] = "The inventory update was successfull."
      redirect_to publishers_path
    else
      flash[:error] = "The inventory update failed. Please try again."
      redirect_to publishers_path
    end
  end

end
