class Game
  attr_accessor :cards, :player, :dealer, :current_control
  def initialize(player_name)
    @cards = Card.cards
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @current_control = nil
  end

  def deal
    player.cards << hit
    dealer.cards << hit
    player.cards << hit
    dealer.cards << hit
    @current_control = player
  end

  def hit
    card = @cards.sample
    @cards.delete(card)
    card
  end

  def stay
    if current_control.class == Player
      current_control = dealer
    else
      current_control = player
    end
    play
  end

  def show_stats
    puts 'Player cards'
    puts "#{player.cards}"
    if current_control.class == Player
      puts 'Dealer cards'
      puts "#{dealer.cards.first}"
    else
      puts 'Dealer card'
      puts "#{dealer.cards}"
    end
  end

  def get_user_choose
    puts '1 - Hit '
    puts '2 - Stay'
    get_in = gets
    get_in
  end

  def play
    check_nearest if !player.can_play? && !dealer.can_play?
    if current_control.can_play?
      puts "#{current_control.class} Playing"
      show_stats
      get_user_choose.chomp == "1" ? game_check : stay
    else
      "#{current_control.class} Stay"
      stay
    end
  end

  def game_check
    current_control.cards << hit
    puts "This is #{current_control.class} score #{current_control.score}"
    check_if_won
    current_control.can_play? ? play : stay
  end

  def check_if_won
    'You Won !!! ' if current_control.score == 21
  end

  def check_nearest
    'Implement'
  end
end
