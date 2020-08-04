class ValueError < StandardError
end

class Board
  def self.transform(input)
    valid?(input)
    input.map!(&:chars)
    input.map.with_index do |segment, index1|
      if index1 == 0 || index1 == input.length - 1
        next segment.join
      end
      segment = transorm_segment(segment, index1, input)
      segment.join
    end
  end

  def self.transorm_segment(segment, index1, input)
    segment.map.with_index do |char, index2|
      mines = 0
      if char == ' '
        mines += segment.slice(index2 - 1, 3).count('*')
        mines += input[index1 - 1].slice(index2 - 1, 3).count('*')
        mines += input[index1 + 1].slice(index2 - 1, 3).count('*')
        mines == 0 ? char : mines
      else
        char
      end
    end
  end

  def self.valid?(input)
    length = input[0].length
    input.each do |segment|
      unless segment.length == length &&
             (segment =~ /\A\+\-+\+\z/ || segment =~ /\A\|[\s\*]+\|\z/)
        raise(ValueError)
      end
    end
  end
end