# frozen_string_literal: true

#  This class holds all of the logic to play a game of tic-tac-toe
class Game
  require_relative 'tic_tac_toe_board'
  require_relative 'player'

  def initialize
    @board = TicTacToeBoard.new
    @game_finished = false
  end

  def play_game
    puts 'Player 1, enter your name'
    player1_name = gets.chomp
    puts 'What character do you want to use for your moves?'
    player1_char = $stdin.getch
    player1 = Player.new(player1_name, player1_char)
    @board.players.push(player1)

    puts "Player 2, enter your name. Cannot use #{board.players[0].player_name}"
    player2_name = gets.chomp
    while player_1_name == player2_name
      puts 'Please enter a valid name'
      player2_name = gets.chomp
    end

    puts "What character do you want to use for your moves? Cannot use #{board.players[0].player_char}"
    player2_char = $stdin.getch
    while player1_char == player2_char
      puts 'Please enter a valid character'
      player2_char = $stdin.getch
    end

    player2 = Player.new(player2_name, player2_char)
    @board.players.push(player2)

    unless @finished_game
      @board.play_turn(@board.players[0])
      @finished_game = @board.players[0].check_for_winner?()

      @board.play_turn(@board.players[1])
      @finished_game = @board.players[1].check_for_winner?()
    end

    puts "Congrats #{@board.winner}, you won the game!"
  end
end
