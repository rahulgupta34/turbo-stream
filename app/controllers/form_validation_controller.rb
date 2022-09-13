class FormValidationController < ApplicationController
  
  def form
    
  end

  def preview
    respond_to do |format|
      # binding.pry
      @form = Form.new(name: params[:name], body: params[:body])
      format.turbo_stream
    end

  end

  def form_selection
    
  end

end
