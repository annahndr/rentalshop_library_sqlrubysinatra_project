require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/book")
require_relative("./models/member")
require_relative("./models/loan")
also_reload('./models/*')


#create a new book
get '/books/new' do
  erb(:books_new)
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

#display all available books
get '/books/available' do
  @books = Book.all_available
  erb (:books)#need to sort something out here
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

#save the edit to the database
post '/books/:id' do
  @book = Book.new(params)
  @book.update()
  erb(:books_show)
end

#display all members
get '/members' do
  @members = Member.all()
  erb (:members)
end
