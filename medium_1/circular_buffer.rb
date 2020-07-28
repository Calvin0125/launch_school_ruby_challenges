class CircularBuffer
  attr_accessor :size
  def initialize(size)
    @buffer = []
    @size = size
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def full?
    @buffer.length >= @size
  end

  def empty?
    @buffer.empty?
  end

  def write(value)
    if full?
      raise(BufferFullException)
    end
    @buffer << value unless value == nil
  end

  def clear
    @buffer = []
  end

  def write!(value)
    return if value == nil
    @buffer.shift if full?
    @buffer << value
  end

  def read
    if empty?
      raise(BufferEmptyException)
    end
    @buffer.shift
  end
end
    