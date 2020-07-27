class Octal
  def initialize(number)
    @number = validate_number(number)
  end

  def validate_number(number)
    number =~ /[a-z89]/i ? 0 : number.to_i
  end

  def to_decimal
    decimal = 0
    @number.digits.each_with_index do |digit, index|
      decimal += (digit * (8**index))
    end
    decimal
  end
end