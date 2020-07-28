require 'pry-byebug'
class InvalidCodonError < StandardError
end

class Translation
  CONVERT = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }

  def self.of_codon(codon)
    CONVERT[codon]
  end

  def self.of_rna(strand)
    codons = strand.chars.each_slice(3).to_a.map(&:join)
    codons.each do |codon|
      return raise(InvalidCodonError) unless CONVERT.keys.include?(codon)
    end

    codons.map! do |codon|
      self.of_codon(codon)
    end

    codons.slice_before { |word| word == 'STOP' }.to_a[0]
  end
end