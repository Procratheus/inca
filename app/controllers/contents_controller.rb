class ContentsController < ApplicationController
  
  def index
    @contents = Content.all
    authorize @contents
  end

  def show
    @content = Content.find(params[:id])
    authorize @content
  end

  def new
    @content = Content.new
    authorize @content
  end

  def create
    @publisher = Publisher.find(params[:publisher_id])
    @content = @publisher.contents.new(content_params)
    authorize @content

    if @content.save
      flash[:success] = "The new content was successfully created."
      redirect_to @content
    else
      flash[:error] = "There was error creating the content. Please try again."
      render :new
    end
  end

  def edit
    @content = Content.find(params[:id])
    authorize @content
  end

  def update
    @publisher = Publisher.find(params[:publisher_id])
    @content = Content.find(params[:id])
    authorize @content

    if @content.update(content_params)
      flash[:success] = "You have successfully updated the content."
      redirect_to @content
    else
      flash[:error] = "There was a problem updating the content. Please try again"
      render :edit
    end
  end

  def destroy
    @content = Content.find(params[:id])
    authorize @content

    if @content.destroy
      flash[:success] = "The content was successfully destroyed."
      redirect_to contents_path
    else
      flash[:error] = "There was a problem destroying the content. Please try again."
      render :show
    end
  end

  protected

  def content_params
    params.require(:content).permit(:kortext_id, :e_isbn, :p_isbn, :type_name, :format, :title, :author, :language,
    :pages, :description, :imprint, :pub_date, :price_gbp, :price_usd, :price_eur, :bic, :bisac, :content_image, :availabilty,
     :edition, :publisher_name, :vat)
  end
end
