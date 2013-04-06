class Watchtick < ActiveRecord::Base
  attr_accessible :tick
  attr_accessor :closing_price

 #def closing_price                 # custom setter method
 #   @closing_price = val.to_s   # clean it up before saving
  #zend

#  self.lastPrice = YahooFinance::get_quotes(quote_type, watchtick.tick )[watchtick.tick].lastTrade.to_s
end
