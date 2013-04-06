class Watchtick < ActiveRecord::Base
  attr_accessible :tick
  attr_accessor :closing_price
end
