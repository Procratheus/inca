class PublishersController < ApplicationController
  before_action :set_publisher, except: [:index, :new]

  def index
    @publishers = Publisher.all
    authorize @publishers
  end

  def show
    
  end

  def new
    @publisher = Publisher.new
    authorize @publisher
  end

  def create
    
    @publisher = Publisher.new(pub_params)
    if @publisher.save
      flash[:success] = "The Publisher was successfully created."
      redirect_to @publisher
    else
      flash[:error] = "There was an error updating the Publisher. Please try again."
      render :new
    end
  end

  def edit
    
  end

  def update
    
    if @publisher.update(pub_params)
      flash[:success] = "The Publisher's details were successfully updated."
      redirect_to @publisher
    else
      flash[:error] = "There was an error updating the Publisher. Please try again."
      render :edit
    end
  end

  def destroy

    if @publisher.destroy
      flash[:success] = "The Publisher was successfully destroyed."
      render :index
    else
      flash[:error] = "There was an error destroying the Publisher. Please try again."
      render :show
    end
  end

  protected

  def set_publisher
    @publisher = Publisher.find(params[:id])
    authorize @publisher
  end

  def pub_params
    params.require(:publisher).permit(:name)
  end
end
