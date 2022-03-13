# frozen_string_literal: true

# Person Class
require './namable'

class Person < Namable
  # add correct_name method that returns the name attribute.
  def correct_name
    @name
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age,
                 name = 'Unknown',
                 parent_permission: true)
    super(name)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  private

  def of_age?
    age.to_i >= 18.to_i
  end
end

class Rental
  attr_accessor :book, :person

  def initialize(book, person)
    @book = book
    @person = person
  end
end

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end

# In the constructor assign a namable object from params to an instance variable.
class Decorator < Namable
  def initialize(component)
    super(component)
    @component = component
  end

  # Implement the correct_name method that returns the result of the correct_name method of the @namable
  def correct_name
    @name.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def initialize(component)
    super(component)
    @component = component
  end

  # Implement a method correct_name that capitalizes the output of @nameable.correct_name
  def correct_name
    @component.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def initialize(component)
    super(component)
    @component = component
  end

  # Implement a method correct_name that makes
  # sure that the output of @nameable.correct_name
  # has a maximum of 10 characters.
  def correct_name
    @component.correct_name[0..9]
  end
end
