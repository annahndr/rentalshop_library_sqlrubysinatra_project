require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/book")
require_relative("./models/member")
require_relative("./models/loan")
also_reload('./models/*')

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

get '/books/new' do
  erb(:books_new)
end
