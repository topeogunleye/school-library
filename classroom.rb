# Create the has-many/belongs-to relationship between Classroom and Student. The following should be implemented:
# Create the has-many side (a classroom has many students).
# Create the belongs-to side (a student belongs to a classroom).
# Make sure that when adding a student to a classroom it also sets the classroom for the student.
# Make sure that when setting the classroom for a student it also adds it to the classrooms' students.

require "./student"
require "./person"

class Classroom
  attr_accessor :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

# class Student
#   attr_accessor :classroom

#   def initialize(classroom)
#     @classroom = classroom
#   end
# end

# Create a class Book with the following:
# @title and @author instance variables, should be initialized in the constructor.
# Setters and getters for instance variables (remember about attr_accessor).

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

# Create a class Rental with the following:
# @date instance variable, should be initialized in the constructor.
# Setter and getter for @date (remember about attr_accessor).
# Modify the constructor of Rental so Book and Person are set in it.

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end
end

# Create the many-to-many (also has-many-through) relationship between Person and Book using the intermediate class Rental. The following should be implemented:
# Create the has-many side of Book and Rental (a book has many rentals).
# Create the belongs-to side of Rental and Book (a rental belongs to a book).
# Create the has-many side of Person and Rental (a person has many rentals).
# Create the belongs-to side of Rental and Person (a rental belongs to a person).

# class Person
#   attr_accessor :name, :rentals

#   def initialize(name)
#     @name = name
#     @rentals = []
#   end

#   def add_rental(rental)
#     @rentals.push(rental)
#     rental.person = self
#   end
# end


