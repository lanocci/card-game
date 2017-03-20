require_relative './card.rb'

class Deck < Card
  @cards = Array.new
  @dealt_index

  def initialize
    @dealt_index = 0
  end

  def set_deck_of_cards(deck_of_cards)
    @cards = deck_of_cards
  end

  def shuffle!
    @cards.shuffle!
  end

  def remaining_cards
    return @cards.size - @dealt_index
  end

  def dealt_hand(number)
    return nil if remaining_cards < number

    hand = Array.new(number)

    (1..number).each do | i |
      card = deal_card
      unless card.nil? then
        hand[i] = card
      end
    end
    return hand
  end

  def deal_card
    if remaining_cards == 0 then
      return nil
    else
      card = @cards[@dealt_index]
      card.mark_unavailable
      @dealt_index += 1
      return card
    end
  end

  def print
    @cards.each do | card |
      card.print
    end
  end
end
