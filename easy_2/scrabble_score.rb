class Scrabble
  def initialize(word)
    @word = word
  end

  def self.compute_score(letter)
    case letter
    when /[aeioulnrst]/i then 1
    when /[dg]/i then 2
    when /[bcmp]/i then 3
    when /[fhvwy]/i then 4
    when 'k' then 5
    when /[jx]/i then 8
    when /[qz]/i then 10
    else
      0
    end
  end

  def self.score(word)
    return 0 unless word.instance_of?(String)
    score = 0
    word.chars.each { |letter| score += self.compute_score(letter) }
    score
  end

  def score
    self.class.score(@word)
  end
end