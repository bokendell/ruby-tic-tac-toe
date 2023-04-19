# frozen_string_literal: true

# This class stores the needed information for each player
class Player
  def initialize(player_name, player_char)
    @player_char = player_char
    @player_name = player_name
    @moves = []
    @possible_wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                      [1, 4, 7], [2, 5, 8], [3, 6, 9],
                      [1, 5, 9], [3, 5, 7]]
  end

  def check_for_winner?
    won_game = false
    @possible_wins.each do |x|
      won_game = true if (x - @possible_wins).empty?
    end
    won_game
  end
end
