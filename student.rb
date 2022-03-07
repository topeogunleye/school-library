require './person'
# Student Class Inheriting From Person Class
class Student < Person
  def initialize(classroom)
    super('student')
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
