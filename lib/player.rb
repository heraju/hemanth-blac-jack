class Player
  attr_accessor :cards
  def initialize(name)
    @name = name
    @cards = []
  end

  def score
    @cards.map{|card| Card.card_value(card) }.inject(:+)
  end

  def can_play?
    score < 21
  end
end
