class Triangle
  attr_reader :height, :rows

  def initialize(height)
    @height = height
    @rows = generate_rows
  end

  def generate_rows
    rows = [[1]]
    2.upto(height) do |row_length|
      row = [1]
      rows[row_length - 2].each_cons(2) do |pair|
        row << pair.sum
      end
      row << 1
      rows << row
    end
    rows
  end
end
