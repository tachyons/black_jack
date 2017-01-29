module BlackJack
  class Deck
    attr_accessor :cards

    def initialize
      Card::SUITES.each do |suit|
        Card::FACES.each do |face|
          cards << Card.new(suit, face)
        end

        Card::NUMBER_VALUE_RANGE.each do |number|
          cards << Card.new(suit, number)
        end
      end
    end

    def cards
      @cards ||= []
    end

    def shuffle
      cards.shuffle!
    end

    def pop
      cards.pop
    end
  end
end
