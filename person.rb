class Animal
  def initialize(name ="Unknown", parent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age

    attr_accessor :name, :age
    attr_reader :id

    def is_of_age? 
      return age >= 18 ? true : false
    end

    private :is_of_age?

  end
end