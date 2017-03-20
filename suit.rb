module Suit
  Club = 0
  Diamond = 1
  Heart = 2
  Spade = 3

  def get_suit_from_value(i)
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
end
