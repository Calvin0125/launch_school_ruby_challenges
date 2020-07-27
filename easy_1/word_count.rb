class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase = @phrase.downcase.split(/[^a-z1-9\']/)
    phrase.reject! { |word| word =~ /\A\'+\z/ || word == '' }
    word_count = Hash.new(0)
    phrase.each do |word|
      word.delete_suffix!("'") if word[0] == "'"
      word.delete_prefix!("'")
      word_count[word] += 1
    end
    word_count
  end
end

