class MaizeRecordsController < ApplicationController
  def index
    @maize_records = MaizeRecord.all(:include => :site, :order => 'id ASC')
  end

  def show
    @maize_record = MaizeRecord.find(params[:id])
  end

  def edit
    @maize_record = MaizeRecord.find(params[:id])
  end

  def update
    if @maize_record = MaizeRecord.update(params[:id], params[:maize_record])
      redirect_to maize_records_path
    else
      render :edit
    end
  end

  def create
    if @maize_record = MaizeRecord.create(params[:maize_record])
      redirect_to @maize_record
    else
      render :new
    end
  end

  def destroy
    @maize_record = MaizeRecord.destroy(params[:id])
  end
end
