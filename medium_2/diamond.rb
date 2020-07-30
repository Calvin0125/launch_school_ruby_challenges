class Diamond
  def self.make_diamond(letter)
    result = self.top_half(letter)
    result += self.bottom_half(letter)
    result
  end

  def self.top_half(letter)
    outer_spaces = letter.ord - 'A'.ord
    result = ' ' * outer_spaces + 'A' + ' ' * outer_spaces + "\n"
    inner_spaces = 1
    current_letter = 'A'
    until current_letter == letter
      current_letter = current_letter.next
      outer_spaces -= 1
      result += ' ' * outer_spaces
      result += current_letter
      result += ' ' * inner_spaces
      result += current_letter
      result += ' ' * outer_spaces
      result += "\n"
      inner_spaces += 2
    end
    result
  end

  def self.bottom_half(letter)
    return '' if letter == 'A'
    current_letter = (letter.ord - 1).chr
    outer_spaces = 1
    inner_spaces = ((letter.ord - 'A'.ord) * 2) - 3
    result = ''
    until current_letter == 'A'
      result += ' ' * outer_spaces
      result += current_letter
      result += ' ' * inner_spaces
      result += current_letter
      result += ' ' * outer_spaces
      result += "\n"
      inner_spaces -= 2
      outer_spaces += 1
      current_letter = (current_letter.ord - 1).chr
    end
    result += ' ' * outer_spaces + 'A' + ' ' * outer_spaces + "\n"
  end
end 
