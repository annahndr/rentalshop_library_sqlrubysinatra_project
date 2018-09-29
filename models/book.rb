require_relative('../db/sql_runner.rb')

class Book

attr_reader :image, :title, :author, :illustrator, :age_range, :checked_out

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


    def self.delete_all
      sql = "DELETE FROM books"
      SqlRunner.run(sql)
    end

  ##
end
