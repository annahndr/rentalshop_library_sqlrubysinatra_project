require('pry-byebug')
require_relative('../models/member.rb')
require_relative('../models/book.rb')
require_relative('../models/loan.rb')


Book.delete_all
Member.delete_all

book1 = Book.new({"image" => "picture", "title" => "Shakleton's Journey", "author" => "William Grill", "illustrator" => "William Grill", "age_range" => "5-8", "checked_out" => "in"})

book2 = Book.new({"image" => "picture", "title" => "Hetty Feather", "author" => "Jacqueline Wilson", "illustrator" => "Nick Sharrat", "age_range" => "9-12", "checked_out" => "in"})

book3 = Book.new({"image" => "picture", "title" => "My Big Shouting Day", "author" => "Rebecca Patterson", "illustrator" => "Rebecca Patterson", "age_range" => "3-5", "checked_out" => "out"})

book1.save
book2.save
book3.save

member1 = Member.new({"name" => "Hope Henderson", "contact" => "email"})
member2 = Member.new({"name" => "Erin Henderson", "contact" => "email"})

member1.save
member2.save

loan1 = Loan.new({"member_id" => member1.id, "book_id" => book2.id, "due_back" => "2018-10-30"})
loan2 = Loan.new({"member_id" => member1.id, "book_id" => book1.id, "due_back" => "2018-10-30"})

loan1.save






binding.pry
nil
