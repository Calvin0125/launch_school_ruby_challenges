require 'pry-byebug'
class Palindromes
  attr_accessor :largest, :smallest
  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @largest = nil
    @smallest = nil
  end

  def palindrome?(number)
    number.digits == number.digits.reverse
  end

  def generate
    range = (@min_factor..@max_factor).to_a
    pairs = range.product(range)
    largest_factors = []
    largest_value = 0
    smallest_factors = []
    smallest_value = @max_factor**2
    pairs.each do |pair|
      product = pair.reduce(:*)
      next unless palindrome?(product)
      if product > largest_value
        largest_value = product
        largest_factors = [pair]
      elsif product == largest_value
        largest_factors << pair
      end

      if product < smallest_value
        smallest_value = product
        smallest_factors = [pair]
      elsif product == smallest_value
        smallest_factors << pair
      end
    end
    largest_factors.map!(&:sort!).uniq!
    smallest_factors.map!(&:sort!).uniq!

    self.smallest = Palindrome.new(smallest_value, smallest_factors)
    self.largest = Palindrome.new(largest_value, largest_factors)   
  end
end

  

class Palindrome
  attr_reader :value, :factors
  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
