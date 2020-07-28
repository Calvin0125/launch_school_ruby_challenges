class Luhn
  def initialize(number)
    @number = number
  end

  def self.addends(number)
    number = number.digits.map.with_index do |digit, index|
      if index.odd?
        digit *= 2
        if digit > 9
          digit - 9
        else
          digit
        end
      else
        digit
      end
    end
    number.reverse
  end

  def self.checksum(number)
    self.addends(number).sum
  end

  def self.valid?(number)
    self.checksum(number) % 10 == 0
  end

  def self.create(number)
    number *= 10
    difference = (10 - (checksum(number) % 10))
    if difference < 10
      number += difference
    end
    number
  end

  def addends
    self.class.addends(@number)
  end

  def checksum
    self.class.checksum(@number)
  end

  def valid?
    self.class.valid?(@number)
  end
end
