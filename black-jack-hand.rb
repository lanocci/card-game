require_relative './hand.rb'

class BlackJackHand < Hand

  MIN_VALUE = -1024
  MAX_VALUE = 1024

  @cards

  def initialize
    super
  end

  def score
    scores = possible_scores
    max_under = MIN_VALUE
    min_over = MAX_VALUE
    scores.each do | score |
      if score > 21 then
        min_over = score
      elsif score <= 21 then
        max_under = score
      end
    end
    return max_under == MIN_VALUE ? min_over : max_under
  end

  def possible_scores
    scores = Array.new
    return scores if @cards.size == 0
    @cards.each do | card |
      add_card_to_score_list(card, scores)
    end
    return scores
  end

  def add_card_to_score_list(card, scores)
    scores.push(0) if scores.length == 0

    num = 0
    l = scores.length

    while num < l
      score = scores[num]
      scores[num] = score + card.min_value
      scores.push(score + card.max_value) unless card.min_value == card.max_value
      num += 1
    end
  end

  def busted
    return score > 21
  end

  def is21
    return score == 21
  end

  def black_jack?
    return false if @cards.size != 2
    first = @cards[0]
    second = @cards[1]
    return first.ace? && second.face_card? || second.ace? && first.face_card?
  end
end
