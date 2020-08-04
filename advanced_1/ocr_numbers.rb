require 'pry-byebug'
class OCR
  def initialize(text)
    @text = text
  end

  NUMBERS = {
    " _\n| |\n|_|" => '0',
    "\n  |\n  |" => '1',
    " _\n _|\n|_" => '2',
    " _\n _|\n _|" => '3',
    "\n|_|\n  |" => '4',
    " _\n|_\n _|" => '5',
    " _\n|_\n|_|" => '6',
    " _\n  |\n  |" => '7',
    " _\n|_|\n|_|" => '8',
    " _\n|_|\n _|" => '9'
  }

  CONVERT = Hash.new('?').merge(NUMBERS)

  def convert
    lines = @text.split("\n\n")
    result = []
    lines.each do |line|
      result << convert_line(line)
    end
    result.join(',')
  end

  def convert_line(line)
    return CONVERT[@text.chomp] if @text[0] == "\n"
    lines = line.split("\n")
    line1 = lines[0].chars.each_slice(3).map(&:join)
    line2 = lines[1].chars.each_slice(3).map(&:join)
    line3 = lines[2].chars.each_slice(3).map(&:join)
    line3.map! { |segment| segment == "|_ " ? "|_" : segment }
    numbers = []
    counter = 0
    line1.length.times do |i|
      number = []
      number << line1[i]
      number << line2[i]
      number << line3[i]
      numbers << number.join("\n")
    end
    numbers.each do |number| 
      number.gsub!(/\s+\n/, "\n")
    end
    
    result = ''
    numbers.each do |number|
      result += CONVERT[number]
    end
    result
  end
end