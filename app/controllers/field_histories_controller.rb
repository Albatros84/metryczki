class FieldHistoriesController < ApplicationController
  def index
    @field_history=FieldHistories.all
  end

  def new
    @field_history.FieldHistories.new
  end

  def edit
    @field_history=FieldHistories.find(params[:id])
  end

  def create
    @field_history = FieldHistories.new(params[:field_history])
    if @field_history.save
      redirect_to root_url
    else
      render "new"
    end
  end
  
  def update
    @field_history=FieldHistories.new(params[:field_history])
    if @field_history.update_attributes(params[:field_history])
      redirect_to root_url
    else
      
    end
    
  end

  def show
    @field_history=FieldHistories.find(params[:id])    
  end
  
   def destroy
    @field_history = FieldHistories.find(params[:id])
    @field_history.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
  
end
