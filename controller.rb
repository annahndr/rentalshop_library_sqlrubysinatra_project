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

#edit a book
get '/books/:id/edit' do
  @book = Book.find(params[:id])
  erb(:books_edit)
end

#save the edit to the database
post '/books/:id' do
  @book = Book.new(params)
  @book.update()
  erb(:books_show)
end
