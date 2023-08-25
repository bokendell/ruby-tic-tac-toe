# frozen_string_literal: true

# This class stores the needed information for each player
class GameBoard
  def initialize
    @current_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @moves_left    = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts " #{@current_board[0]} | #{@current_board[1]} | #{@current_board[2]}"
    puts '___________'
    puts " #{@current_board[3]} | #{@current_board[4]} | #{@current_board[5]}"
    puts '___________'
    puts " #{@current_board[6]} | #{@current_board[7]} | #{@current_board[8]}"
  end

  def add_move(character, location)
    @current_board[location - 1] = character
    @moves_left.delete(location)
  end

  def board_full?
    @moves_left.empty?
  end

  def valid_move?(location)
    @moves_left.include?(location)
  end
end
