class MaizeRecordsController < ApplicationController
  def index
    @maize_records = MaizeRecord.all(:include => :site)
  end

  def show
    @maize_record = MaizeRecord.find(params[:id])
  end

  def edit
    @maize_record = MaizeRecord.find(params[:id])
  end

  def update
    @maize_record = MaizeRecord.update_attributes(params[:maize_record])
  end

  def create
    @maize_record = MaizeRecord.create(params[:maize_record])
  end

  def destroy
    @maize_record = MaizeRecord.destroy(params[:id])
  end
end
