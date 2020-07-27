class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand_to_compare)
    length = @strand.length > strand_to_compare.length ? strand_to_compare.length : @strand.length
    distance = 0

    length.times do |index|
      distance += 1 unless strand_to_compare[index] == @strand[index]
    end

    distance
  end
end
