require 'pry-byebug'
class Game
  def initialize
    @rolls = []
  end

  def roll(pins)
    if (pins > 10 || pins < 0) ||
       (second_roll? && @rolls[-1] + pins > 10) ||
       game_over?
      raise(StandardError)
    end

    @rolls << pins
  end

  def second_roll?
    first_roll = true
    @rolls.each do |roll|
      first_roll = !first_roll unless roll == 10
    end
    !first_roll
  end

  def game_over?
    frame = 0
    first_roll = true
    @rolls.each_with_index do |roll, index|
      if frame == 9
        if @rolls[index + 1]
          if roll + @rolls[index + 1] >= 10 && @rolls[index + 2]
            frame += 1
          elsif roll + @rolls[index + 1] < 10
            frame += 1
          end
        end
      elsif frame < 9
        if roll == 10
          frame += 1
        elsif !first_roll
          frame += 1
          first_roll = !first_roll
        elsif first_roll
          first_roll = !first_roll
        end
      end
    end
    frame == 10
  end

  def score
    raise(StandardError) unless game_over?
    score = 0
    first_roll = true
    @rolls.each_with_index do |roll, index|
      if !first_roll
        if @rolls[index - 1] + roll == 10 && @rolls[index + 1]
          score += (10 + @rolls[index + 1])
        elsif @rolls[index + 1] || @rolls[index - 2] != 10
          score += (@rolls[index - 1] + roll)
        end
        first_roll = !first_roll
      elsif roll == 10 && @rolls[index + 1] && @rolls[index + 2]
        score += roll + @rolls[index + 1] + @rolls[index + 2]
      else
        first_roll = !first_roll unless roll == 10
      end
    end
    score
  end
end
