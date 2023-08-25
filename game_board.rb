# frozen_string_literal: true

# This class stores the needed information for each player
class GameBoard

  def initialize
    @current_board = [1...9]
    @moves_left = [1...9]
  end


  def display_board
    puts " #{@current_board[0]} | #{@current_board[1]} | #{@current_board[2]}"
    puts '___________'
    puts " #{@current_board[3]} | #{@current_board[4]} | #{@current_board[5]}"
    puts '___________'
    puts " #{@current_board[6]} | #{@current_board[7]} | #{@current_board[8]}"
  end

  def add_move(location, character)
    @current_board[location] = character
    @moves_left -= location
  end






  def play_turn(player)
    puts "#{player}, enter the number on the board of where you want to play"
    desired_move = gets.chomp
    unless @moves_left.include? desired_move
      puts 'Please enter a valid location'
      desired_move = gets.chomp
    end

    player.moves.push(desired_move)
    @moves_left.delete(desired_move)
    @current_board[desired_move - 1] = player.player_char

    @winner = player.name if player.check_for_winner
    display_board
  end
end
