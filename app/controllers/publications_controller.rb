class PublicationsController < ApplicationController
  def index
    @publications = Publication.all(:include => :samples, :order => 'id ASC')
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    if @publication = Publication.update(params[:id], params[:publication])
      redirect_to publications_path
    else
      render :edit
    end
  end

  def create
    if @publication = Publication.create(params[:publication])
      redirect_to @publication
    else
      render :new
    end
  end

  def destroy
    @publication = Publication.destroy(params[:id])
  end
end
