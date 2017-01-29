module BlackJack
  class Contestant
    attr_accessor :cards

    def initialize(game)
      @game = game
    end

    def stand; end

    def hit
      cards << @game.decks.sample.pop
    end

    def cards
      @cards ||= []
    end

    def score
      cards.collect(&:value).inject(:+)
    end

    def to_s
      "Number of cards #{cards.count} \n
       Total score #{score}"
    end

    def black_jack?
      score == 21
    end
  end
end
