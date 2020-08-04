STUDENTS = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
class Garden
  def initialize(diagram, students = STUDENTS)
    @diagram = diagram.split("\n")
    @students = students
    create_student_variables(students)
  end

  PLANTS = {
    'G' => :grass,
    'C' => :clover,
    'R' => :radishes,
    'V' => :violets
  }

  def create_student_variables(students)
    students.sort.each do |student|
      self.send(:instance_variable_set, "@#{student.downcase}", plants(student))
      self.class.send(:attr_reader, :"#{student.downcase}")
    end
  end

  def plants(student)
    index = @students.sort.index(student)
    plants = []
    @diagram.each do |row|
      plants << row[index * 2, 2]
    end
    plants.join.chars.map { |char| PLANTS[char] }
  end
end

