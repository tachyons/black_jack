module BlackJack
  class Game
    attr_accessor :player, :dealer, :result, :winner, :decks
    attr_reader :over
    def initialize(number_of_decks)
      raise ArgumentError, 'Number of decks must be 4 or more' if number_of_decks < 4
      @player = Player.new(self)
      @dealer = Dealer.new(self)
      @decks = Array.new(number_of_decks) { Deck.new }
    end

    def over?
      player.busted? || dealer.busted? || player.black_jack? && dealer.black_jack?
    end

    def winner
      @winner ||=
        begin
        if player.busted?
          'Dealer'
        elsif dealer.black_jack? && player.black_jack?
          'Draw'
        elsif player.score != dealer.score
          [@dealer, @player].min { |contestant| 21 - contestant.score }.class.name
        elsif player.code == dealer.code
          'Draw'
        end
      end
    end

    def begin
      puts 'Welcome to Black Jack'
      @decks.each(&:shuffle)
      2.times { player.cards << @decks.sample.pop }
      2.times { dealer.cards << @decks.sample.pop }
      until over?
        puts status
        puts 'HIT OR STAND'
        input = gets.chomp
        if input =~ /hit/i
          player.hit
        elsif input =~ /stand/i
          player.stand
        else
          puts 'Wrong input, please try again'
          redo
        end
        dealer.move
      end
      puts '=================GAME OVER========================'
      p "STATUS #{status}\n"
      p "Winner is #{winner}"
    end

    def status
      "Player : #{player} \n Dealer  #{dealer} "
    end
  end
end
