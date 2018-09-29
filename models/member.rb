require_relative('../db/sql_runner.rb')

class Member

attr_reader :id
attr_accessor :name, :email

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @email = options['email']
  end

  def save()
      sql = "INSERT INTO members
      (
        name, email
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@name, @email, @id]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def update()
      sql = "UPDATE members SET (name, email) =
      ($1, $2)
      WHERE id =  $3"
      values = [@image, @email, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM members WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

end
