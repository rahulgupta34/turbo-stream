class CheckboxController < ApplicationController
  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.checkbox_delete(params[:chk_values])
    @category.destroy_all
    @categories = Category.all
    respond_to do |format|      
        format.turbo_stream 
    end
  end

end