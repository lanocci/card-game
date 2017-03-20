require_relative './card.rb'
require_relative './deck.rb'
require_relative './black-jack-card.rb'
require_relative './black-jack-hand.rb'

class BlackJackGameAutomator
  @deck
  @hands

  HIT_UNTIL = 16

  def initialize(num_players)
    @hands = Array.new(num_players)
    @deck = Deck.new
  end

  def deal_initial
    @hands.each_with_index do | hand, i |
      hand = BlackJackHand.new
      card1 = @deck.deal_card
      card2 = @deck.deal_card
      return false if card1 == nil or card2 == nil
      hand.add_card(card1)
      hand.add_card(card2)
      @hands[i] = hand
    end
    puts "@hands: #{@hands.inspect}"
    return true
  end

  def get_black_jacks
    winners = Array.new
    @hands.each do |hand|
      winners.add(hand.index) if hand.black_jack?
    end
    return winners
  end

  def play_hand_by_index(i)
    hand = @hands[i]
    return play_hand(hand)
  end

  def play_hand(hand)
    while hand.score < HIT_UNTIL do
      card = @deck.deal_card
      return false if card == nil
      hand.add_card(card)
    end
    return true
  end

  def play_all_hands
    @hands.each do | hand |
      return false unless play_hand(hand)
    end
    return true
  end

  def get_winners
    winners = Array.new
    winning_score = 0
    @hands.each_with_index do | hand, i |
      unless hand.busted then
        if hand.score > winning_score
          winning_score = hand.score
          winners.clear
          winners.push(i)
        elsif hand.score == winning_score
          winners.push(i)
        end
      end
    end
    return winners
  end

  def initialize_deck
    cards = Array.new
    (1..13).each do | i |
      (1..3).each do | j |
        suit = Card.get_suit_from_value(j)
        card = BlackJackCard.new(i, suit)
        cards.push(card)
      end
    end
    @deck = Deck.new
    @deck.set_deck_of_cards(cards)
    @deck.shuffle!
  end

  def print_hands_and_score
    @hands.each_with_index do | hand, i |
      puts "Hand #{i}(#{hand.score}):#{hand}"
    end
  end
end
