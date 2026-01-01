# frozen_string_literal: true

require_relative 'lib/mastermind'

game = Mastermind.new
rounds = 0
until game.game_over? || rounds == 8
  game.make_guess
  game.guess_correct?
  rounds += 1
end
print 'you won! The colors were: '
game.reveal_secrets
