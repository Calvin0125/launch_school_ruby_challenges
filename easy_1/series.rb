class Series
  def initialize(series)
    @series = series
  end

  def slices(n)
    raise(ArgumentError) if n > @series.length
    result = []
    @series.chars.each_cons(n) { |slice| result << slice.map(&:to_i) }
    result
  end

end