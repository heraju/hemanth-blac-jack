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

  def bursted?
    p "#{self.class} Bursted" if score > 21
    score > 21
  end
end
