require 'pry-byebug'
def fibonacci(max)
  return [0] if max == 1
  return [0, 1] if max == 2
  sequence = fibonacci(max- 1)
  sequence << sequence[-1] + sequence[-2] if (sequence[-1] + sequence[-2]) <= max
  sequence
end

p fibonacci(1000)