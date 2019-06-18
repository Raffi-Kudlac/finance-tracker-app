class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks

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

  def self.find_by_ticker(ticker)
    return Stock.find_by(ticker: ticker)
  end

  def self.strip_commas(numb)
    numb.gsub(",", "")
  end
end
