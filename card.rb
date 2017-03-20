class Card
  @suit
  @face_value
  @available
  @suit

  def initialize (c, s)
    @face_value = c
    @suit = s
  end

  def self.get_suit_from_value(i)
    case i
    when 0 then
      return "Club"
    when 1 then
      return "Diamond"
    when 2 then
      return "Heart"
    when 3 then
      return "Spade"
    end
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

  def print
    fave_values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    p face_values[@face_value]
    case @suit
    when "Club"
      p "c"
    when "Heart"
      p "h"
    when "Diamond"
      p "d"
    when "Spade"
      p "s"
    end
    p " "
  end
end
