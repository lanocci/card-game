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

  def initialize (c, s)
    @faceValue = c
    @suite = s
  end

  def value()
  end

  def available?
    return @available
  end

  def mark_unavailable
    @available = false
  end

  def mark_available
    @available = true
  end
  
end

class Hand < Card
  @cards = Array.new

  def score
    score = 0
    for card in @cards do
      score += card.value
    end
    return score
  end
  
  def addCard(card)
    @cards.add(card)
  end
    
end

class Deck < Card
  @cards = Array.new
  @dealtIndex = 0

  def setDeckOfCards deckOfCards
  end

  def shuffle!
    @cards.shuffle!
  end

  def remainingCards
    return cards.size - dealtIndex
  end

  def dealtHand number
    if remainingCards < number then
      return nil
    end

    hand = Card[number]
    int count = 0

    while count < number do
      card = dealCard
      if !card.null? then
        hand[count] = card
        count++
      end
    end

    return hand
  end

  def dealCard
  end

  def print
    for card in @cards do
      card.print
    end
  
end
