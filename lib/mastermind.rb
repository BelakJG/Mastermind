# frozen_string_literal: true

class Mastermind
  COLORS = %w[Green Red Blue Brown Orange Yellow].freeze
  attr_accessor :guess

  def initialize(amount = 4)
    new_game(amount)
    print 'The possible colors are '
    p COLORS
  end

  def new_game(amount = 4)
    @secret_colors = COLORS.sample(amount)
  end

  def reveal_secrets
    p @secret_colors
  end

  def make_guess
    puts "Make your guess! (don't worry about capitalizing the color)"
    @guess = gets.chomp.split(' ')
    @guess.map!(&:capitalize)
  end

  def display_guess
    p guess
  end
end
