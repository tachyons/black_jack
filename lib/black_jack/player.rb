module BlackJack
  class Player < Contestant
    def busted?
      score > 21
    end
  end
end
