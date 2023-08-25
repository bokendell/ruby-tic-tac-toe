# frozen_string_literal: true

#  This class holds all of the logic to play a game of tic-tac-toe
class Game
  require 'io/console'
  require_relative 'game_board'
  require_relative 'player'

  attr_reader :game_finished

  def initialize
    @board = GameBoard.new
    @players = []
    @game_finished = false
  end

  def add_player(player_name, player_char)
    @players.push(Player.new(player_name, player_char))
  end

  def setup_new_game
    puts 'Player 1, enter your name'
    player1_name = gets.chomp
    puts 'What character do you want to use for your moves?'
    player1_char = $stdin.getch
    add_player(player1_name, player1_char)

    puts "Player 2, enter your name. Cannot use #{player1_name}"
    player2_name = gets.chomp
    while player1_name == player2_name
      puts 'Please enter a valid name'
      player2_name = gets.chomp
    end

    puts "What character do you want to use for your moves? Cannot use #{player1_char}"
    player2_char = $stdin.getch
    while player1_char == player2_char
      puts 'Please enter a valid character'
      player2_char = $stdin.getch
    end

    add_player(player2_name, player2_char)
  end

  def play_turn()
    @board.display_board
    puts "#{@players[0].player_name}, enter the number on the board of where you want to play"
    desired_move = gets.chomp.to_i
    unless @board.valid_move?(desired_move)
      puts 'Please enter a valid location'
      desired_move = gets.chomp.to_i
    end

    update_game_state(@players[0], desired_move)
    if @game_finished
      return
    end

    puts "#{@players[1].player_name}, enter the number on the board of where you want to play"
    desired_move = gets.chomp.to_i
    unless @board.valid_move?(desired_move)
      puts 'Please enter a valid location'
      desired_move = gets.chomp.to_i
    end

    update_game_state(@players[1], desired_move)
  end

  def update_game_state(player, move)
    player.add_move(move)
    @board.add_move(player.player_char, move)
    @board.display_board

    if player.check_for_winner?
      puts "#{player.player_name} won the game!"
      @game_finished = true
    end

    if @board.board_full?
      puts 'It was a tie!'
      @game_finished = true
    end
  end

  def replay_game?
    puts 'Would you like to play again Y/N'
    answer = gets.chomp

    unless [Y, N].include?(answer)
      puts 'Please enter a valid response'
      answer = gets.chomp
    end

    if answer == 'Y'
      true
    else
      false
    end
  end

  def end_game
    puts 'Thanks for playing!'
  end
end
