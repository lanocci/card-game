require_relative './card.rb'

class BlackJackCard < Card
  def initialize(c, s)
    super(c, s)
  end

  def value
    if ace? then
      return 1
    elsif face_card? then
      return 10
    else
      return @face_value
    end
  end

  def min_value
    if ace? then
      return 1
    else
      return value
    end
  end

  def max_value
    if ace? then
      return 11
    else
      return value
    end
  end

  def ace?
    return @face_value == 1
  end

  def face_card?
    return @face_value >= 11 && @face_value <= 13
  end
end
