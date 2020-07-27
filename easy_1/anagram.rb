class Anagram
  def initialize(word)
    @word = word
  end

  def match(anagrams)
    result = []
    anagrams.each do |anagram|
      next if anagram.downcase == @word.downcase
      result << anagram if (anagram.downcase.chars.sort == @word.downcase.chars.sort)
    end
    result
  end
end