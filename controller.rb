require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/book")
require_relative("./models/member")
require_relative("./models/loan")
also_reload('./models/*')

#BOOKS
#create a new book
get '/books/new' do
  erb(:books_new)
end

#send new book info to the database
post '/books' do
  @book = Book.new(params)
  @book.image=params[:image][:filename]
  file = params[:image][:tempfile]
  #wb is write binary
  File.open("./public/images/#{@book.image}", "wb") do |f|
  f.write(file.read)
  end
  @book.save()
  redirect '/books'
end

#display all available books
get '/books/available' do
  @books = Book.all_available
  erb (:books_available)#need to sort something out here
end

#display all books on loan
get '/books/on-loan' do
  @books = Book.all_checked_out
  erb(:books_on_loan)
end

post '/books-age-range' do
  @books = Book.get_by_age(params[:age_range])
  erb(:books_age_range)
end

#show one book
get '/books/:id' do
  @book = Book.find(params[:id])
  erb(:books_show)
end

#display all books
get '/books' do
  @books = Book.all()

  erb (:books)
end

#edit a book
get '/books/:id/edit' do
  @book = Book.find(params[:id])
  erb(:books_edit)
end

#delete a book
post '/books/:id/delete' do
  @book = Book.find(params[:id])
  @book.delete()
  redirect '/books'
end

#save the book edit to the database
post '/books/:id' do
  @book = Book.new(params)
  @book.image=params[:image][:filename]
  file = params[:image][:tempfile]
  #wb is write binary
  File.open("./public/images/#{@book.image}", "wb") do |f|
  f.write(file.read)
  end
  @book.update()
  redirect '/books'
end

#LIBRARY MEMBERS

#create a new member
get '/members/new' do
  erb(:members_new)
end

#edit a member
get '/members/:id/edit' do
  @member = Member.find(params[:id])
  erb (:members_edit)
end

#save the member edit to the database
post '/members/:id' do
  @member = Member.new(params)
  @member.update()
  erb(:members_show)
end

#show one member
get '/members/:id' do
  @member = Member.find(params[:id])
  erb (:members_show)
end

#display all members
get '/members' do
  @members = Member.all()
  erb (:members)
end

#send new member info to the database
post '/members' do
  @member = Member.new(params)
  @member.save()
  redirect '/members'
end

#LOANS

# return a book and delete a loan
# locate the loan to be deleted
# call the book relevant to that loan
# return the book back to stock
# delete the loan
# send the user back to the loans page
post '/loans/:id/delete' do
  @loan = Loan.find(params[:id])
  @book = @loan.book
  @book.return_book
  @loan.delete
  redirect '/loans'
end

#show all loans
get '/loans' do
  @loans = Loan.all()
  erb (:loans)
end

#create a new loan
get '/loans/new' do
  @members = Member.all()
  @books = Book.all_available()
  erb(:loans_new)
end

#save loan to database
#update book in database
post '/loans' do
  @loan = Loan.new(params)
  @loan.save
  @book = Book.find(params[:book_id])
  @book.check_out_book
  redirect '/loans'
end
