class SumOfMultiples
  def initialize(*set)
    @set = set
  end

  def self.to(limit)
    set = [3, 5]
    sum = 0
    1.upto(limit - 1) do |num|
      set.each do |divisor|
        if num % divisor == 0
          sum += num
          break
        end
      end
    end
    sum
  end

  def to(limit)
    sum = 0
    1.upto(limit - 1) do |num|
      @set.each do |divisor|
        if num % divisor == 0
          sum += num
          break
        end
      end
    end
    sum
  end
end