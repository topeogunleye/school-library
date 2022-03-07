# frozen_string_literal: true

require './teacher'
# Teacher Class Inheriting From Person Class
class Teacher < Person
  def initialize(specialization)
    super('teacher')
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
