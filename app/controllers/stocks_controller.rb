class StocksController < ApplicationController

  def search
    @stock = Stock.new_from_lookup(params[:stock])
    if (!@stock)
      flash[:danger] = "Invalid  search parameters"
    end
    render my_portfolio_path
  end
end
