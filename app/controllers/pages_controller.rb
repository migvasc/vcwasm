class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
   
    
  end

  def download_pdf
    
    target = open("#{Rails.root}/app/assets/javascripts/wget.js", 'w')
    target.truncate(0)
    target.write("")
    cont =1 
    IO.foreach("#{Rails.root}/app/views/pages/wget.js") do |line|
      if cont==1625
        caminho = "wget.wasm"
        caminho = "\'"+caminho+"\'"
        target.write("var wasmBinaryFile = Module['wasmBinaryFile'] || "+caminho+";\n")
      else 
        target.write(line)
      end
      cont = cont+1
    end
    target.close()
  end
    helper_method :download_pdf

  
    
end
