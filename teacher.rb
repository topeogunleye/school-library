# frozen_string_literal: true

require './teacher'

class Teacher < Person
  def initialize(specialization)
    super('teacher')
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
