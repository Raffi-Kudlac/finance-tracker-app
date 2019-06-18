class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)

    begin
      client = Alphavantage::Client.new(key: "ULALZZJR14R1IYCY")
      search_data = client.search(keywords: ticker_symbol)
      stock_data = search_data.stocks[0]
      name = stock_data.name
      ticker = stock_data.symbol

      price = strip_commas(stock_data.stock.quote.price)
    rescue Exception => e
      return nil
    end
    return Stock.new(name: name, ticker: ticker,
       last_price: price)
  end

  def self.strip_commas(numb)
    numb.gsub(",", "")
  end
end
