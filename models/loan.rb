require_relative('../db/sql_runner')

class Loan


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

#a method to find all loans


# def borrow_a_book
#   #create a new loan
#   borrowed_book = Loan.new(params)
#   borrowed_book.save

##
end
