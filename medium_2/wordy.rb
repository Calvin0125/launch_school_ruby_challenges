require 'pry-byebug'
class WordProblem
  attr_accessor :answer
  def initialize(question)
    @question = question
    @answer = calculate_answer
  end

  ALLOWED_WORDS = ['what', 'is', 'multiplied', 'by', 'divided', 'minus', 'plus']
  OPERATORS = {
    'divided' => :/,
    'multiplied' => :*,
    'minus' => :-,
    'plus' => :+
  }

  def calculate_answer
    question = @question.chop.downcase.split
    raise(ArgumentError) unless valid_question?(question)

    question.shift(2)
    question.delete('by')

    answer = question.shift.to_i
    0.step(by: 2, to: question.length - 2) do |i|
      answer = answer.send(OPERATORS[question[i]], question[i + 1].to_i)
    end
    self.answer = answer
  end

  def valid_question?(question)
    question.each do |word|
      unless ALLOWED_WORDS.include?(word) || word =~ /\-?[0-9]+/
        return false 
      end
    end
    true
  end
end

