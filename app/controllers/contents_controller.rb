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
      redirect_to [@publisher, @content]
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
      redirect_to [@publisher, @content]
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
      render :index
    else
      flash[:error] = "There was a problem destroying the content. Please try again."
      render :show
    end
  end

  protected

  def content_params
    params.require(:content).permit(:kortext_id, :e_isbn, :p_isbn, :type, :format, :title, :author, :language,
    :pages, :description, :imprint, :pubdate, :price_gbp, :price_usd, :price_eur, :bic, :bisac, :image, :availabilty)
  end
end
