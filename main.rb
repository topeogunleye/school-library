#!/usr/bin/env ruby
require "pry"

require "./classroom"
require "./person"
require "./teacher"
require "./student"

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # def get_user_input
    
  # end

  def list_books
    binding.pry
    if @books.length != 0
    @books.each do |book|
      puts "Book title: #{book.title}"
      puts "Book author: #{book.author}"
    end
    elsif @books.length == 0
    puts "There are no books in the library"
    end
    main
  end

  def list_people
    @people.each do |person|
      # case person
      # when person.subject
        puts "Teacher name: #{person.name}"
        puts "Teacher subject: #{person.subject}"
        puts "Teacher age: #{person.age}"
      # when person.classroom
        puts "Student name: #{person.name}"
        puts "Student classroom: #{person.classroom}"
        puts "Student age: #{person.age}"
      # end
    end
    main
  end

  def create_person
    puts "What type of person would you like to create?"
    puts "1. Teacher"
    puts "2. Student"
    type = gets.chomp.to_i
    if type == 1
      puts "What subject does the teacher take?"
      subject = gets.chomp
      puts "What is the age of the teacher?"
      age = gets.chomp.to_i
      puts "What is the name of the teacher?"
      name = gets.chomp
      puts "Does the teacher have permission to use the library services?"
      permission = gets.chomp.to_i
      @people.push(Teacher.new(subject, age, name, parent_permission: permission))
    elsif type == 2
      puts "What classroom is the student?"
      classroom = gets.chomp
      puts "What is the age of the student?"
      age = gets.chomp.to_i
      puts "What is the name of the student?"
      name = gets.chomp
      puts "Does the student have permission to use the library services?"
      permission = gets.chomp.to_i
      @people.push(Student.new(classroom, age, name, parent_permission: permission))
    end
    main

  end

  def create_book
    puts "What is the book title ?"
    title = gets.chomp
    puts "What is the book author ?"
    author = gets.chomp
    Book.new(title, author)

    @books.push(author, title)
    main
  end

  def create_rental
    put "What is the rental date?"
    date = gets.chomp
    put "What is the rental book?"
    book = gets.chomp
    put "Who is the rental person?"
    person = gets.chomp

    @rentals.push(Rental.new(date, book, person))
    main
  end

  def list_rentals(_person_id)
    list_books
    list_people
    create_person("teacher")
    create_book
    create_rental("10/10/10", create_book, create_person("student"))
    main
  end
end

# rubocop:disable Metrics/MethodLength
def main
  app = App.new

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
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental("10/10/10", create_book, create_person("student"))
  when 6
    puts App.list_rentals(1)
  when 7
    puts "Goodbye!"
    exit
  else
    puts "Invalid choice"
  end
end
# rubocop:enable Metrics/MethodLength

main
