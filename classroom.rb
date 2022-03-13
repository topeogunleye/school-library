# classroom, book and rental classes are defined
require './student'
require './person'

class Classroom
  attr_accessor :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
