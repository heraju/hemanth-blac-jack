require 'game'

describe Game do
  describe ".cards" do
    context 'total cards are 52 in count' do
      it 'returns 52' do
        expect(Game.new('player').cards.count).to eql(52)
      end
    end
  end

  describe ".deal" do
    context 'has a player with name' do
      it 'game starts player has a score' do
        game = Game.new('player')
        game.deal
        expect(game.player.score.class).to eql(Fixnum)
      end
      it 'removes the card from deck set' do
        game = Game.new('player')
        game.deal
        expect(game.cards.count).to eql(48)
      end

    end

    context 'has a dealer' do
      it 'game starts dealer has a score' do
        game = Game.new('player')
        game.deal
        game.play
        expect(game.player.score.class).to eql(Fixnum)
      end
    end
  end

  describe ".deal" do
    context 'player has two card' do
    end
    context 'dealer has two card' do
    end
  end

  describe ".hit" do
    context 'get a random card' do
    end
  end

  describe ".stand" do
    context 'pass control to dealer or player' do
    end
  end
end
