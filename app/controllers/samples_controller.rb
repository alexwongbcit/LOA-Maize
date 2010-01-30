class SamplesController < ApplicationController
  def index
    @samples = Sample.all(:include => [:site, :publications], :order => 'id ASC')
  end

  def show
    @sample = Sample.find(params[:id])
  end

  def edit
    @sample = Sample.find(params[:id])
  end

  def update
    if @sample = Sample.update(params[:id], params[:sample])
      redirect_to samples_path
    else
      render :edit
    end
  end

  def create
    if @sample = Sample.create(params[:sample])
      redirect_to @sample
    else
      render :new
    end
  end

  def destroy
    @sample = Sample.destroy(params[:id])
  end
end
