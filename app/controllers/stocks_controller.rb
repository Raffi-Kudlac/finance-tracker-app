class StocksController < ApplicationController

  def search
    @stock = Stock.new_from_lookup(params[:stock])
    flash.now[:danger] = "Invalid  search parameters" if !@stock    
    respond_to do |format|
      format.js {render partial: 'users/result'}
    end
  end
end
