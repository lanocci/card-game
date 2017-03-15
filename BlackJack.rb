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
  
end
