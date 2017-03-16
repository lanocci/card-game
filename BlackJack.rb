require 'CardGame.rb'

class BlackJackHand < Hand
  def score
    scores = possibleScores
    maxUnder = MIN_VALUE
    minOver = MAX_VALUE
    for score in scores do
      if score > 21 && score < minOver then
        minOver = score
      elsif score <= 21 && score > maxUnder then
        maxUnder = score
      end
    end
    return maxUnder == MIN_VALUE ? minOver : maxUnder
  end

  def possibleScores
  end

  def busted
    return score > 21
  end

  def is21
    return score == 21
  end

  def isBlackJack
    return false if @cards.size != 2
    BlackJackCard first = @cards.get(0)
    BlackJackCard second = @cards.get(1)
    return first.ace? && second.faceCard? || second.ace? && faceCard?
  end
end
