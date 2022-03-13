#!/usr/bin/env ruby

require './classroom'
require './book'
require './rental'
require './person'
require './teacher'
require './student'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def getuserinput
    puts 'Welcome to the Library App'
    puts 'What would you like to do?'
    puts '1. List Books'
    puts '2. List People'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Quit'
  end

  def list_books
    books = JSON.parse(File.read('books.txt'))
    if !books.empty?
      books.each do |book|
        puts "Book title: #{book.title}"
        puts "Book author: #{book.author}"
      end
    elsif books.length.zero?
      puts 'There are no books in the library'
    end
    main
  end

  def list_people
    people = JSON.parse(File.read('people.txt'))
    people.each do |person|
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

  # rubocop:disable Metrics/MethodLength
  def create_person
    puts 'What type of person would you like to create?'
    puts '1. Teacher'
    puts '2. Student'
    type = gets.chomp.to_i
    case type
    when 1
      puts 'What subject does the teacher take?'
      subject = gets.chomp
      puts 'What is the age of the teacher?'
      age = gets.chomp.to_i
      puts 'What is the name of the teacher?'
      name = gets.chomp
      puts 'Does the teacher have permission to use the library services?'
      permission = gets.chomp.to_i
      Store.push(student)
      @people.push(Teacher.new(subject, age, name, parent_permission: permission))
      File.write('people.txt', @people.to_s)
    when 2
      puts 'What classroom is the student?'
      classroom = gets.chomp
      puts 'What is the age of the student?'
      age = gets.chomp.to_i
      puts 'What is the name of the student?'
      name = gets.chomp
      puts 'Does the student have permission to use the library services?'
      permission = gets.chomp.to_i
      Store.push(student)
      @people.push(Student.new(classroom, age, name, parent_permission: permission))
      File.write('people.txt', @people.to_s)
    end
    main
  end
  # rubocop:enable Metrics/MethodLength


  def create_book
    puts 'What is the book title ?'
    title = gets.chomp
    puts 'What is the book author ?'
    author = gets.chomp
    Book.new(title, author)

    @books.push(Book.new(author, title))
    File.write('books.txt', @books.to_s)
    main
  end

  def create_rental
    @rentals.push(Rental.new(@date, @book, @person))
    File.write('rentals.txt', @rentals.to_s)
  end

  def list_rentals
    #  Listing rentals should loop the @rentals instance variable to display the rentals created by that user.
    rentals = JSON.parse(File.read('rentals.txt'))
    rentals.each do |rental|
      puts "Rental date: #{rental.date}"
      puts "Rental book: #{rental.book}"
      puts "Rental person: #{rental.person}"
    end
  end
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
def main
  app = App.new

  app.getuserinput

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
    app.create_rental('10/10/10', create_book, create_person('student'))
  when 6
    puts App.list_rentals
  when 7
    puts 'Goodbye!'
    exit
  else
    puts 'Invalid choice'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity

main
