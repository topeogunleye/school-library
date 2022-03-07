require './teacher.rb'

class Teacher < Person 
  def initialize(specialization)
    super("teacher")
    @specialization = specialization
  end

  def can_use_services? 
    return true
  end

end