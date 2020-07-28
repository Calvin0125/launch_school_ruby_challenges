require 'pry-byebug'
class PhoneNumber
  attr_reader :number
  def initialize(number)
    @number = clean_number(number)
  end

  def clean_number(number)
    return '0' * 10 if number =~ /[a-z]/i
    number = number.scan(/\d+/).join
    if number.length == 10
      number
    elsif number.length == 11 && number[0] == '1'
      number.slice(1, 10)
    else
      '0' * 10
    end
  end

  def area_code
    number.slice(0, 3)
  end

  def to_s
    "(#{area_code}) #{number.slice(3, 3)}-#{number.slice(6, 4)}"
  end
end

