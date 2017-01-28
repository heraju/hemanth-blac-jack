class Dealer
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def score
    @cards.map{|card| Card.card_value(card) }.inject(:+)
  end

  def can_play?
    score < 17
  end
end
