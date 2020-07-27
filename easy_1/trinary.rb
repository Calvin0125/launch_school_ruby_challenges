class Trinary
  def initialize(number)
    @number = validate_number(number)
  end

  def validate_number(number)
    if number =~ /\A[012]+\z/
      number.to_i
    else
      0
    end
  end

  def to_decimal
    decimal = 0
    @number.digits.each_with_index do |digit, index|
      decimal += (digit * (3**index))
    end
    decimal
  end
end
