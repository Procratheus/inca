class Api::InventoryImportsController < ApiController
  require "open-uri"

  def import_all
    Content.transaction do
      @bulk_contents = ImportInventory.call
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

  def import_image_all
    Content.transaction do
      @contents = Content.all
      authorize @contents
      @contents.each do |content|
        ImportImages.call(content)
      end
      @contents.each do |content|
        image_file = "#{Rails.root.to_s}/public/img/content-images/#{content.kortext_id}.jpg"
        no_image_file = "#{Rails.root.to_s}/public/img/no-content-available.jpg"
        source_url = content.content_image
        file = open(source_url) != nil ? open(source_url) : open(no_image_file)   
        File.open(image_file, "wb") do |f|
          f.write file.read
        end
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
