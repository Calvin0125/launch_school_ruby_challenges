class Queens
  attr_reader :white, :black
  def initialize(white: [0, 3], black: [7, 3])
    raise(ArgumentError) if white == black
    @white = white
    @black = black
  end

  def to_s
    board = Array.new(8) { Array.new(7) { '_ '} << '_' }
    if @white[1] == 7
      board[@white[0]][@white[1]] = 'W'
    else
      board[@white[0]][@white[1]] = 'W '
    end
     
    if @black[1] == 7
      board[@black[0]][@black[1]] = 'B'
    else
      board[@black[0]][@black[1]] = 'B '
    end

    board.map(&:join).join("\n")
  end

  def attack?
    attack_row? || attack_column? || attack_diagonal?
  end

  def attack_row?
    @white[0] == @black[0]
  end

  def attack_column?
    @white[1] == @black[1]
  end

  def attack_diagonal?
    1.upto(7) do |i|
      if @white[0] == @black[0] + i && @white[1] == @black[1] + i ||
         @white[0] == @black[0] - i && @white[1] == @black[1] + i ||
         @white[0] == @black[0] - i && @white[1] == @black[1] - i ||
         @white[0] == @black[0] + i && @white[1] == @black[1] - i
        return true
      end
    end
    false
  end
end