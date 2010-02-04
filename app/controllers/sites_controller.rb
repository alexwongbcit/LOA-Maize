class SitesController < ApplicationController
  def index
    @sites = Site.all(:include => :samples, :order => 'id ASC')
  end

  def show
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    if @site = Site.update(params[:id], params[:site])
      redirect_to sites_path
    else
      render :edit
    end
  end

  def create
    if @site = Site.create(params[:site])
      redirect_to @site
    else
      render :new
    end
  end

  def destroy
    @site = Site.destroy(params[:id])
  end
end
