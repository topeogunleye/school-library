# frozen_string_literal: true

require './person'

class Student < Person
  def initialize(classroom)
    super('student')
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
