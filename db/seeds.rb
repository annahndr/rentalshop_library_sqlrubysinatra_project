# require('pry-byebug')
require_relative('../models/member.rb')
require_relative('../models/book.rb')
require_relative('../models/loan.rb')


Book.delete_all
Member.delete_all

book1 = Book.new({"image" => "/shakleton.jpg", "title" => "Shakleton's Journey", "author" => "William Grill", "illustrator" => "William Grill", "age_range" => "5-8", "checked_out" => "out"})

book2 = Book.new({"image" => "/hettyfeather.jpg", "title" => "Hetty Feather", "author" => "Jacqueline Wilson", "illustrator" => "Nick Sharrat", "age_range" => "9-12", "checked_out" => "out"})

book3 = Book.new({"image" => "/bigshoutingday.jpg", "title" => "My Big Shouting Day", "author" => "Rebecca Patterson", "illustrator" => "Rebecca Patterson", "age_range" => "3-5", "checked_out" => "in"})

book4 = Book.new({"image" => "/tintin.jpg", "title" => "Tintin and the Black Island", "author" => "Herge", "illustrator" => "Herge", "age_range" => "9-12", "checked_out" => "in"})

book5 = Book.new({"image" => "/elephantinthegarden.jpg", "title" => "Elephant in the Garden", "author" => "Michael Morpurgo", "illustrator" => "Michael Foreman", "age_range" => "9-12", "checked_out" => "in"})

book6 = Book.new({"image" => "/fantasticmrfox.jpeg", "title" => "Fantastic Mr Fox", "author" => "Roald Dahl", "illustrator" => "Quentin Blake", "age_range" => "5-8", "checked_out" => "in"})

book7 = Book.new({"image" => "/presshere.jpg", "title" => "Press Here", "author" => "Herve Tullet", "illustrator" => "Herve Tullet", "age_range" => "5-8", "checked_out" => "in"})

book8 = Book.new({"image" => "/biscuitbear.jpg", "title" => "Biscuit Bear", "author" => "Mimi Grey", "illustrator" => "Mimi Grey", "age_range" => "5-8", "checked_out" => "in"})

book1.save
book2.save
book3.save
book4.save
book5.save
book6.save
book7.save
book8.save


member1 = Member.new({"name" => "Asma Malik", "contact" => "email"})
member2 = Member.new({"name" => "Jane Kennedy", "contact" => "email"})

member1.save
member2.save

loan1 = Loan.new({"member_id" => member1.id, "book_id" => book2.id, "due_back" => "2018-10-30"})
loan2 = Loan.new({"member_id" => member1.id, "book_id" => book1.id, "due_back" => "2018-10-30"})

loan1.save
loan2.save

# binding.pry
# nil
