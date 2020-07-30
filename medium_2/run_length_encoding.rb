class RunLengthEncoding
  def self.encode(string)
    previous_char = string[0]
    encoded = ''
    counter = 0
    string.chars.each_with_index do |char, index|
      if index == string.length - 1
        if previous_char == char
          counter += 1
          encoded += counter.to_s
          encoded += previous_char
        else
          encoded += counter.to_s if counter > 1
          encoded += previous_char
          encoded += char
        end
      else
        if previous_char == char
          counter += 1
        else
          encoded += counter.to_s if counter > 1
          encoded += previous_char
          previous_char = char
          counter = 1
        end
      end
    end
    encoded
  end

  def self.decode(string)
    number = ''
    decoded = ''
    string.chars.each do |char|
      if char =~ /\d/
        number += char
      else
        if number.to_i > 0
          decoded += char * number.to_i
        else
          decoded += char
        end
        number = ''
      end
    end
    decoded
  end
end


      
