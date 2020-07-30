class Robot
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a

  @@names_in_use = []

  attr_reader :name
  def initialize
    @name = generate_name
  end

  def generate_name
    name = "#{LETTERS.sample}#{LETTERS.sample}#{NUMBERS.sample}#{NUMBERS.sample}#{NUMBERS.sample}"
    while @@names_in_use.include?(name)
      name = "#{LETTERS.sample}#{LETTERS.sample}#{NUMBERS.sample}#{NUMBERS.sample}#{NUMBERS.sample}"
    end
    @@names_in_use << name
    name
  end

  def reset
    @name = generate_name
  end
end
