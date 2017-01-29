class Game
  attr_accessor :cards, :player, :dealer
  def initialize(player_name)
    @cards = Card.cards
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @activity = []
  end

  def deal
    player.cards << hit
    dealer.cards << hit
    player.cards << hit
    dealer.cards << hit
    @activity << player
  end

  def hit
    card = @cards.sample
    @cards.delete(card)
    card
  end

  def current_control
    return @activity.last
  end

  def stay
    p current_control.class == Player
    if current_control.class == Player
      @activity << dealer
      p current_control.class
    else
      @activity << player
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
    if current_control.can_play?
      puts "#{current_control.class} Playing"
      show_stats
      get_user_choose.chomp == "1" ? game_check : stay
    else
      puts "#{current_control.class} Stay"
      stay
    end
  end

  def game_check
    current_control.cards << hit
    puts "This is #{current_control.class} score #{current_control.score}"
    if !check_if_won  && !check_if_bursted
      current_control.can_play? ? play : stay
    end
  end

  def check_if_won
    if current_control.score == 21
      p 'You Won !!! '
      return true
    end
    false
  end

  def check_if_bursted
    current_control.bursted?
  end

  def check_nearest
    'Implement'
  end

  def start
    check_nearest if !player.can_play? && !dealer.can_play?
    play
  end
end
