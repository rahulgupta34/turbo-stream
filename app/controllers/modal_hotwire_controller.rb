class ModalHotwireController < ApplicationController
  def index
  end

  def create
    @rahul = Rahul.new(name: params[:name])
    respond_to do |format|
      if @rahul.save
        format.turbo_stream
      else
        format.turbo_stream
      end
    end
  end
end
