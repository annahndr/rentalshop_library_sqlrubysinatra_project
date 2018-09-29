require_relative('../db/sql_runner.rb')
require_relative('./loan')


class Member

attr_reader :id
attr_accessor :name, :contact

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
  end

  def save()
      sql = "INSERT INTO members (name, contact) VALUES ($1, $2) RETURNING id"
      values = [@name, @contact]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def update()
      sql = "UPDATE members SET (name, contact) =
      ($1, $2)
      WHERE id =  $3"
      values = [@image, @contact, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM members WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all
      sql = "SELECT * FROM members"
      members = SqlRunner.run(sql)
      return members.map{|member_hash| Member.new(member_hash)}
    end

    def self.delete_all
      sql = "DELETE FROM members"
      SqlRunner.run(sql)
    end

end
