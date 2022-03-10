class Namable

  def initialize(name)
    @name = name
  end
  
  # Implement a method called correct_name that will raise a NotImplementedError
  def correct_name
    raise NotImplementedError
  end

end