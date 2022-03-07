require './person'
# Teacher Class Inheriting From Person Class
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('Science', 20, 'Jon Snow', false)

puts teacher.can_use_services?
