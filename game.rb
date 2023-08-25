# frozen_string_literal: true

#  This class holds all of the logic to play a game of tic-tac-toe
class Game
  require_relative 'game_board'
  require_relative 'player'

  def initialize
    @board = GameBoard.new
    @players = []
  end

  def add_player(player_name, player_char)
    players.push(Player.new(player_name, player_char))
  end

  def setup_new_game
    curr_game = Game.new
    puts 'Player 1, enter your name'
    player1_name = gets.chomp
    puts 'What character do you want to use for your moves?'
    player1_char = $stdin.getch
    curr_game.add_player(player1_name, player1_char)

    puts "Player 2, enter your name. Cannot use #{player1_name}"
    player2_name = gets.chomp
    while player_1_name == player2_name
      puts 'Please enter a valid name'
      player2_name = gets.chomp
    end

    puts "What character do you want to use for your moves? Cannot use #{player2_char}"
    player2_char = $stdin.getch
    while player1_char == player2_char
      puts 'Please enter a valid character'
      player2_char = $stdin.getch
    end

    curr_game.add_player(player2_name, player2_char)
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
