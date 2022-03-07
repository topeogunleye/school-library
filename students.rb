require './person.rb'

class Student < Person 
  def initialize(classroom)
    super("student")
    @classroom = classroom
  end

end