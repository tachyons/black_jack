module BlackJack
  class Dealer < Contestant
    def move
      return false if busted?
      if score <= 17
        hit
      else
        stand
      end
    end

    def busted?
      score < 21
    end
  end
end
