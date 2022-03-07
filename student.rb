require './person'
# Student Class Inheriting From Person Class
class Student < Person
  def initialize(classroom, name)
    super('student')
    @classroom = classroom
    @name = name
  end

  def play_hooky
   "¯\(ツ)/¯"
  end
end

student = Student.new("class1", "Victor")

puts student.play_hooky()
puts student.name