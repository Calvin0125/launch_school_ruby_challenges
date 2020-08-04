class Matrix
  def initialize(string)
    @matrix = string
  end

  def rows
    @matrix.split("\n").map(&:split).map { |row| row.map(&:to_i) }
  end

  def columns
    rows.transpose
  end

  def saddle_points
    points = []
    rows.each_with_index do |row, row_index|
      row.each_with_index do |digit, column_index|
        if digit == row.max && digit == columns[column_index].min
          points << [row_index, column_index]
        end
      end
    end
    points
  end
end

