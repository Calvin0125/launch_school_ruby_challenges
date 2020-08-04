class Cipher
  attr_reader :key
  def initialize(key = nil)
    @key = validate(key) || random_key
  end

  def random_key
    key = ''
    100.times do 
      key += rand(97..122).chr
    end
    key
  end

  def validate(key)
    if key =~ /[A-Z0-9]/ || key == '' || (!key.instance_of?(String) && !key.nil?)
      raise(ArgumentError, "The key must be a string of lowercase letters.")
    elsif key.nil?
      nil
    else
      key
    end
  end

  def decode(text)
    expand_key(text)
    decoded = text.chars.map.with_index do |char, index|
      if char =~ /[a-zA-Z]/
        factor = ('a'.ord - @key[index].ord)
        shift(char, factor)
      else
        char
      end
    end
    decoded.join
  end

  def encode(text)
    expand_key(text)
    encoded = text.chars.map.with_index do |char, index|
      if char =~ /[a-zA-Z]/
        factor = (@key[index].ord - 'a'.ord)
        shift(char, factor)
      else
        char
      end
    end
    encoded.join
  end

  def shift(char, factor)
    if char =~ /[A-Z]/
      char = (char.ord + factor).chr
      if char.ord > 90
        char = (char.ord - 26).chr
      elsif char.ord < 65
        char = (char.ord + 26).chr
      end
    elsif char =~ /[a-z]/
      char = (char.ord + factor).chr
      if char.ord > 122
        char = (char.ord - 26).chr
      elsif char.ord < 97
        char = (char.ord + 26).chr
      end
    end
    char
  end

  def expand_key(text)
    if @key.length < text.length
      until @key.length >= text.length
        @key = @key * 2
      end
    end
  end

end




