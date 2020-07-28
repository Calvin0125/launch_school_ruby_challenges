def odd_words(string)
  string.chop.split.map.with_index { |word, index| index.odd? ? word.reverse : word }.join(' ') + '.'
end

puts odd_words("What's the matter with Kansas.")