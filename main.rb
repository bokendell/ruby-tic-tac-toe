# frozen_string_literal: true

require_relative 'game'

def play_game
  game = Game.new
  game.play_game
end

def replay_game
  puts 'Would you like to play again Y/N'
  answer = gets.chomp

  unless [Y, N].include?(answer)
    puts 'Please enter a valid response'
    answer = gets.chomp
  end

  if answer == Y
    game = Game.new
    game.play_game
  else
    puts 'Thanks for playing!'
  end
end

play_game
