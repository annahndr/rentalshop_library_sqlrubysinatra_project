require_relative('../db/sql_runner')

class Loan

  attr_accessor :due_back
  attr_reader :id, :member_id, :book_id


def initialize(options)
  @id = options['id'].to_i if options['id']
  @member_id = options['member_id']
  @book_id = options['book_id']
  @due_back = options['due_back']
end

def save()
    sql = "INSERT INTO loans (member_id, book_id, due_back) VALUES ($1, $2, $3) RETURNING id"
    values = [@member_id, @book_id, @due_back]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
end

def update
  sql = "UPDATE members SET (member_id, book_id, due_back) = ($1, $2, $3) WHERE id = $4"
  values = [@member_id, @book_id, @due_back, @id]
  SqlRunner.run(sql, values)
end

def member
  sql = "SELECT * FROM members INNER JOIN loans ON loans.member_id = members.id WHERE loans.id = $1"
  values = [@id]
  row =SqlRunner.run(sql, values).first
  return Member.new(row)
end

def book
  sql = "SELECT * FROM books INNER JOIN loans ON loans.book_id = books.id WHERE loans.id = $1"
  values = [@id]
  row =SqlRunner.run(sql, values).first
  return Book.new(row)
end

def delete
  sql = "DELETE FROM loans WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.find(id)
sql = "SELECT * FROM loans WHERE id = $1"
values = [id]
loan = SqlRunner.run( sql, values )
return Loan.new( loan.first )
end

def self.all
    sql = "SELECT * FROM loans"
    loans = SqlRunner.run(sql)
    return loans.map {|loan_hash| Loan.new(loan_hash)}
end

##
end
