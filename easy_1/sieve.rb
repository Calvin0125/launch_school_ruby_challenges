class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    numbers = (2..@limit).to_a
    result = []
    until numbers.empty?
      result << numbers.shift
      numbers.reject! { |num| num % result.last == 0 }
    end
    result
  end
end