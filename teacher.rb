require './teacher.rb'

class Teacher < Person 
  def initialize(specialization)
    super("teacher")
    @specialization = specialization
  end

end