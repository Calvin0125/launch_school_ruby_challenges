require 'pry-byebug'
class RailFenceCipher
  def self.encode(string, n)
    rails = generate_rails_array(n)
    letters = string.chars
    rails = generate_rails(letters, rails, n)
    rails.flatten.join
  end

  def self.generate_rails(letters, rails, n)
    rail = 0
    increasing = true
    letters.each do |letter|
      rails[rail] << letter
      if rail < (n - 1) && increasing
        rail += 1
        increasing = false if rail == n - 1
      elsif rail > 0 && increasing == false
        rail -= 1
        increasing = true if rail == 0
      end
    end
    rails
  end


  def self.generate_rails_array(n)
    rails = []
    n.times do
      rails << []
    end
    rails
  end

  def self.rail_lengths(letters, rails, n)
    rails = generate_rails(letters, rails, n)
    lengths = Hash.new(0)
    rails.each_with_index do |rail, index|
      lengths[index] += rail.length
    end
    lengths
  end

  def self.separate_rails(string, lengths, n)
    string_index = 0
    rails = []
    n.times do |i|
      rails << string[string_index, lengths[i]]
      string_index += lengths[i]
    end
    rails
  end

  def self.join_rails(text_length, rails, n)
    decoded = []
    rail = 0
    increasing = true
    text_length.times do
      decoded << rails[rail].shift
      if rail < (n-1) && increasing
        rail += 1
        increasing = false if rail == (n - 1)
      elsif rail > 0 && increasing == false
        rail -= 1
        increasing = true if rail == 0
      end
    end
    decoded.join
  end


  def self.decode(string, n)
    lengths = rail_lengths(string.chars, generate_rails_array(n), n)
    string_index = 0
    rails = separate_rails(string, lengths, n)
    rails.map!(&:chars)
    join_rails(string.length, rails, n)
  end  
end