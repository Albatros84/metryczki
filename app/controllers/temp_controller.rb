class TempController < ApplicationController
  def myupdate  
    @project=Project.find(:id) 
    respond_to do |format|
      
        format.js {@project}
     
    end

     
  end
end
