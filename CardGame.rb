module Suite
  Club = 0
  Diamond = 1
  Heart = 2
  Spade = 3
end

class Card
  @suite
  @faceValue
  @available

  def available?
    return @available
  end

  def mark_unavailable
  end

  def initialize (c, s)
    @faceValue = c
    @suite = s
  end

  def value()
  end

  
end

class Hand
  @card[]
end

class Deck < Card
  @cards = []
  @dealtIndex = 0

  def setDeckOfCards deckOfCards
  end

  def shuffle
  end

  def remainingCards
    return cards.size - dealtIndex
  end

  def dealtHand number
  end

  def dealCard
  end
  
end

