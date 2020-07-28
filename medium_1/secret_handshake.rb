class SecretHandshake
  KEY = {
    1 => 'wink',
    10 => 'double blink',
    100 => 'close your eyes',
    1000 => 'jump',
    10000 => 'reverse'
  }
  
  attr_reader :commands

  def initialize(code)
    @code = code
    @commands = read_code
  end

  def read_code
    code = convert_code
    handshake = []
    code.reverse.chars.each_with_index do |digit, index|
      if digit == '1'
        digit = digit.to_i * (10**index)
        handshake << KEY[digit]
      end
    end

    if handshake.last == 'reverse'
      handshake.pop
      handshake.reverse
    else
      handshake
    end
  end


  def convert_code
    if @code.instance_of?(Integer)
      @code.to_s(2)
    elsif @code.instance_of?(String) && @code =~ /\A[10]+\z/
      @code
    else
      '0'
    end
  end
end