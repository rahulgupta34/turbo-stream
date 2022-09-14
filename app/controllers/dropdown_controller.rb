class DropdownController < ApplicationController
  def country
  end

  def state
   if params[:country] == ""
    @states = ["Select"]
   else
    @states = CS.states(params[:country]).invert
    
   end
    respond_to do |format|
      format.turbo_stream
    end
  end

  def city
    @cities = CS.cities(params[:state],params[:country])
    respond_to do |format|
      format.turbo_stream
    end
  end

end
