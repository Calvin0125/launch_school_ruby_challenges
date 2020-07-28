class PigLatin
  VOWELS = %w(a e i o u)
  CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
  
  def self.translate(string)
    words = string.split
    words.map! do |word|
      if VOWELS.include?(word[0]) || word =~ /\Ay[^aeioux]+/ || word =~ /\Ax[^aeiouy]+/
        word + 'ay'
      else
        word = word.chars
        first = []
        while CONSONANTS.include?(word[0]) || (first.last == 'q' && word.first == 'u')
          first << word.shift
        end
        (word + first).join + 'ay'rub
      end
    end
    words.join(' ')
  end
end