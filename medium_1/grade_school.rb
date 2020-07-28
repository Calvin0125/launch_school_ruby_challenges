class School
  def initialize
    @students = Hash.new([])
  end

  def to_h
    @students
  end

  def add(student, grade)
    @students[grade] += [student]
    @students[grade].sort!
    @students = @students.sort.to_h
    @students.default = []
  end

  def grade(grade)
    @students[grade]
  end
end