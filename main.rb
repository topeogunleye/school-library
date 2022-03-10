# Create methods that do the following:
# List all books.
# List all people.
# Create a person (teacher or student, not a plain Person).
# Create a book.
# Create a rental.
# List all rentals for a given person id.

require "./classroom"
require "./person"

def list_books
  Book.all.each do |book|
    puts book.title
  end
end

def list_people
  Person.all.each do |person|
    puts person.name
  end
end

def create_person(type)
  if type == "teacher"
    Teacher.new("Pysics", 20, "Jon Snow", parent_permission: false)
  elsif type == "student"
    Student.new("Class1", 19, "Trent", parent_permission: false)
  end
end

def create_book
  Book.new("Harry Potter", "JK Rowling")
end

def create_rental(date, book, person)
  Rental.new(date, book, person)
end

def list_rentals(person_id)
  list_books
  list_people
  create_person("teacher")
  create_book
  create_rental("10/10/10", create_book, create_person("student"))
end

# define the entry point, this will be a method called main that is invoked at the end of your file. This method should do the following:
#   Present the user with a list of options to perform.
#   Lets users choose an option.
#   If needed, ask for parameters for the option.
#   Have a way to quit the app.

def main
  puts "Welcome to the Library App"
  puts "What would you like to do?"
  puts "1. List Books"
  puts "2. List People"
  puts "3. Create a person"
  puts "4. Create a book"
  puts "5. Create a rental"
  puts "6. List all rentals for a given person id"
  puts "7. Quit"

  choice = gets.chomp.to_i

  case choice
  when 1
    list_books
  when 2
    list_people
  when 3
    puts "What type of person would you like to create?"
    puts "1. Teacher"
    puts "2. Student"
    type = gets.chomp.to_i
    create_person("teacher") if type == 1
    create_person("student") if type == 2
  when 4
    create_book
  when 5
    create_rental("10/10/10", create_book, create_person("student"))
  when 6
    list_rentals(1)
  when 7
    puts "Goodbye!"
  else
    puts "Invalid choice"
  end

  main
end
