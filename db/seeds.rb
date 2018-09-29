require('pry-byebug')
require_relative('../models/loan.rb')
require_relative('../models/member.rb')
require_relative('../models/book.rb')

Book.delete_all

book1 = Book.new({"image" => "picture", "title" => "Shakleton", "author" => "William Grill", "illustrator" => "William Grill", "age_range" => "5-8", "checked_out" => "in"})

book2 = Book.new({"image" => "picture", "title" => "Hetty Feather", "author" => "Jacqueline Wilson", "illustrator" => "Nick Sharrat", "age_range" => "9-12", "checked_out" => "in"})

book1.save
book2.save





binding.pry
nil
