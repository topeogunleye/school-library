# Person Class
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age,
                 name = 'Unknown',
                 _parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  def of_age?
    age >= 18
  end

  private :is_of_age?

  def can_use_services?
    is_of_age? || parent_permission ? true : false
  end
end
