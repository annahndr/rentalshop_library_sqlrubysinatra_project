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

#a method to get member name from loan?
#can't get sql syntax right
def member_name
  sql = "SELECT name FROM members WHERE loans.member_id = members.id"
  return SqlRunner.run(sql)
end

def self.all
    sql = "SELECT * FROM loans"
    loans = SqlRunner.run(sql)
    return loans.map {|loan_hash| Loan.new(loan_hash)}
end

##
end
