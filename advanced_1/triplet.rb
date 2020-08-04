class Triplet
  def initialize(*numbers)
    @triplet = numbers
  end

  def sum
    @triplet.sum
  end

  def product
    @triplet.reduce(:*)
  end

  def pythagorean?
    @triplet[0]**2 + @triplet[1]**2 == @triplet[2]**2
  end
   
  def self.where(max_factor: 1000, min_factor: 1, sum: nil)
    triplets = self.combinations(min_factor, max_factor).map do |combination|
      Triplet.new(*combination)
    end

    triplets.select! { |triplet| triplet.pythagorean? }
    if sum
      triplets.select! { |triplet| triplet.sum == sum }
    end
    triplets
  end

  def self.combinations(min, max)
    arr = (min..max).to_a
    arr.product(arr).product(arr).map(&:flatten).map(&:sort).uniq
  end
end

