module BlackJack
  class Card
    FACES = [:king, :queen, :jack, :ace].freeze
    SUITES = [:diamond, :club, :heart, :spade].freeze
    SUITE_SYMBOLS = ['♠', '♣','♦', '♥'].freeze
    NUMBER_VALUE_RANGE = 2..10
    attr_reader :suit, :type

    def initialize(suit, type)
      @type = type
      @suit = suit
    end

    def value
      return type if numbered?
      case type
      when :king, :queen, :jack
        10
      when :ace
        favourable_for_player
      end
    end

    private

    def numbered?
      type.is_a? ::Integer
    end

    def face_card?
      !numbered?
    end

    def favourable_for_player
      # TODO
      1
    end
  end
end
