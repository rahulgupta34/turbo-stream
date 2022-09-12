class LazyloadingController < ApplicationController
  def index
    @pagy, @lazy_loads = pagy(LazyLoading.order(id: :desc), items: 5)
    @total_count = @lazy_loads + 5 if params[:page]
    render "scrollable" if params[:page]
  end
end
