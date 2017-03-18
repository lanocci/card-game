class Question
  @num_hands = 5
  
  @automator = BlackJackGameAutomator.new(num_hands)
  @automator.initializeDeck

  @success = automator.deal_initial

  if !@success then
    puts "Error. Out of Cards."
  else
    puts "--Initial--"
    @automator.print_hands_and_score
    blackjacks = automator.get_black_jacks
    if blackjacks.size > 0 then
      p "Blackjack at "
      for i : Blackjack
        p "#{i}, "
      end
      puts ""
    else
      success = automator.play_all_hands
      if !@success
        puts "Error. Out of Cards."
      else
        puts "\n-- Complete Game --"
        automator.print_hands_and_score
        winners = automator.get_winners
        if winners.size > 0 then
          p "Winners: "
          for i : winners
            p "#{i}, "
          end
          puts ""
        else
          puts "Draw. All players have busted."
        end
      end
    end
  end
