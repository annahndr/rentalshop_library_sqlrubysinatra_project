require_relative('../db/sql_runner.rb')

class Book

attr_reader :id
attr_accessor :image, :title, :author, :illustrator, :age_range, :checked_out

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @image = options['image']
    @title = options['title']
    @author = options['author']
    @illustrator = options['illustrator']
    @age_range = options['age_range']
    @checked_out = options['checked_out']
  end

  def save()
      sql = "INSERT INTO books
      (
        image, title, author, illustrator, age_range, checked_out
      )
      VALUES
      (
        $1, $2, $3, $4, $5, $6
      )
      RETURNING id"
      values = [@image, @title, @author, @illustrator, @age_range, @checked_out]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def update()
      sql = "UPDATE books SET (image, title, author, illustrator, age_range, checked_out) =
      ($1, $2, $3, $4, $5, $6)
      WHERE id =  $7"
      values = [@image, @title, @author, @illustrator, @age_range, @checked_out, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM books WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all_available
      sql = "SELECT * FROM books WHERE checked_out = $1"
      values = ['in']
      books = SqlRunner.run(sql, values)
      return books.map {|book_hash| Book.new(book_hash)}
    end

    def self.all
        sql = "SELECT * FROM books"
        books = SqlRunner.run(sql)
        return books.map {|book_hash| Book.new(book_hash)}
    end

    def self.delete_all
      sql = "DELETE FROM books"
      SqlRunner.run(sql)
    end

  ##
end
