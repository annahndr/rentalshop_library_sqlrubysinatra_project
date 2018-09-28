require_relative('../db/sql_runner')

class Loan


def initialize(options)
  @id = options['id'].to_i if options['id']
  @customer_id = options['customer_id']
  @book_id = options['customer_id']
  @due_back = options['due_back']
end



##
end
