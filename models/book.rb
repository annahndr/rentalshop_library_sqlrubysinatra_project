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


  ##
end
