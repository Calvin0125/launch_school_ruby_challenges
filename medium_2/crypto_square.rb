class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def normalize_plaintext
    @plaintext.gsub(/[_\W]/, '').downcase
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def normalize_ciphertext
    ciphertext = []
    plaintext_segments[0].length.times do |i|
      cipher_segment = ''
      plaintext_segments.each do |segment|
        cipher_segment += segment[i] if segment[i]
      end
      ciphertext << cipher_segment
    end
    ciphertext.join(' ')
  end

  def ciphertext
    normalize_ciphertext.gsub(/\s/, '')
  end

end
