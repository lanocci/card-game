class Hand < Card
  @cards

  def initialize
    @cards = Array.new
  end

  def score
    score = 0
    for card in @cards do
      score += card.value
    end
    return score
  end

  def add_card(card)
    @cards.push(card)
  end

  def print
    @cards.each do |card|
      card.print
    end
  end
end
