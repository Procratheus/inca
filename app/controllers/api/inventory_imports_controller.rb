class Api::InventoryImportsController < ApiController

  def import_all
    Content.transaction do
      @bulk_contents = ImportInventory.call
      authorize @bulk_contents
    end

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
      authorize @delta_contents
    end

    if @delta_contents
      flash[:success] = "The inventory update was successfull."
      redirect_to publishers_path
    else
      flash[:error] = "The inventory update failed. Please try again."
      redirect_to publishers_path
    end
  end

  def import_image_all
    Content.transaction do
      @contents = Content.all
      authorize @contents
      @contents.each do |content|
        ImportImages.call(content)
      end
    end

    if @contents
      flash[:success] = "The inventory update was successfull."
      redirect_to publishers_path
    else
      flash[:error] = "The inventory update failed. Please try again."
      redirect_to publishers_path
    end
  end

end
