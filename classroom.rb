class Classroom
  # @label instance variable, should be initialized in the constructor.

  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

# Create the has-many/belongs-to relationship between Classroom and Student
  def add_student(student)
    @students << student
  end

end

# Create the belongs-to side (a Student belongs to a classroom).
class Student
  attr_accessor :classroom

  

end