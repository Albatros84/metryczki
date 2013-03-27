class TempController < ApplicationController
  def myupdate  
    @project=Project.find(:id) 
    respond_to do |format|
      
        format.js {@project}
     
    end

  def index
      Prawn::Document.generate("hello.pdf") do
    text "Hello World!"
  end  
    
    
    output = HelloReport.new.to_pdf

     respond_to do |format|
       format.pdf do
         send_data output, :filename => "hello.pdf", 
                           :type => "application/pdf"
       end
     end
   end


     
  end
end
