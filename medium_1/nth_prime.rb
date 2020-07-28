class Prime
  def self.nth(n)
    raise(ArgumentError) if n < 1

    counter = 0
    current_num = 1
    while counter < n
      current_num += 1
      is_prime = true
      (2..Math.sqrt(current_num).round).each do |num|
        is_prime = false if current_num % num == 0
      end
      counter += 1 if is_prime
    end
    current_num
  end
end



