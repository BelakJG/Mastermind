# frozen_string_literal: true

class Mastermind
  COLORS = %w[Green Red Blue Brown Orange Yellow].freeze
  attr_accessor :guess, :secret_colors, :exact_guess, :close_guess

  def initialize(amount = 4)
    new_game(amount)
    @guess = Array.new(amount)
    print 'The possible colors are '
    p COLORS
  end

  def new_game(amount = 4)
    @secret_colors = []
    amount.times do
      @secret_colors.push(COLORS[rand(0...COLORS.length)])
    end
  end

  def player_colors(array)
    @secret_colors = array.map(&:capitalize)
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

  def guess_correct?
    @exact_guess = 0
    @close_guess = 0
    marked_exact = Array.new(guess.length)
    marked_close = Array.new(guess.length)
    # right color and column
    (0...guess.length).each do |index|
      if guess[index] == secret_colors[index]
        @exact_guess += 1
        marked_exact[index] = 1
      end
    end
    # right color wrong column
    (0...guess.length).each do |index|
      next if marked_exact[index] == 1

      (0...guess.length).each do |n|
        next unless guess[index] == secret_colors[n] && marked_exact[n] != 1 && marked_close[n] != 1

        @close_guess += 1
        marked_close[n] = 1
        break
      end
    end
    if exact_guess == secret_colors.length
      puts 'All colors correct!'
    else
      puts "#{exact_guess} colors are exact and #{close_guess} are right but in the wrong column"
    end
    puts ''
  end

  def game_over?
    exact_guess == secret_colors.length
  end
end
