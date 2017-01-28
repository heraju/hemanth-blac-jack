require 'card'
describe Card do
  describe ".cards" do
      context 'total cards are 52 in count' do
        it 'has four decks' do
          expect(Card.deck.count).to eql(4)
        end
        it 'has 13 card set for each deck' do
          expect(Card.card_set.count).to eql(13)
        end
        it 'returns 52' do
          expect(Card.cards.count).to eql(52)
        end
      end
      context 'given a card has value and belongs to deck' do
        it 'returns 2 from D' do
          expect(Card.which_card(['D',2])).to eql('2 from D')
        end
        it 'returns value of card' do
          expect(Card.card_value(['D',2])).to eql(2)
        end
     end
  end
end

