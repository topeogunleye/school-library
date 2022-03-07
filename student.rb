require './person.rb'

class Student < Person 
  def initialize(classroom)
    super("student")
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end

end