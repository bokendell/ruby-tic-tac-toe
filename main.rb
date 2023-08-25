# frozen_string_literal: true

require_relative 'game'

def play_new_game
  game = Game.new
  game.setup_new_game
  game_finished = false

  while not (game_finished)
    game.play_turn
    game_finished = game.game_finished
  end

  if game.replay_game?
    play_new_game
  else
    game.end_game
  end
end

play_new_game
