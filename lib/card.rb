class Card
  def self.cards
    cards = []
    deck.each do |deck|
      card_set.each do |card_value|
        card = [deck, card_value]
        cards << card
      end
    end
    cards
  end

  def self.deck
    %w(D C S H)
  end

  def self.card_set
    card_set = (2..10).to_a
    %w(A J Q K).map{ |item| card_set << item }
    card_set
  end

  def self.which_card(card)
    "#{card[1]} from #{card[0]}"
  end

  def self.card_value(card)
    return card[1] if card[1].class == Fixnum
    return 1 if card[1] == 'A'
    10
  end
end
