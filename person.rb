class Animal
  def initialize(name , age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end
end