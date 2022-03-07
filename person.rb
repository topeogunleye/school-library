class Animal
  def initialize(name ="Unknown", parent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end
end