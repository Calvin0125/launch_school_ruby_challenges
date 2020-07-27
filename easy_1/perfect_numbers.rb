class PerfectNumber
  def self.classify(num)
    raise(StandardError) if num < 1

    sum = 0
    1.upto(num - 1) do |current_num|
      sum += current_num if num % current_num == 0
    end

    if sum == num
      'perfect'
    elsif sum > num
      'abundant'
    else
      'deficient'
    end
  end
end
