require_relative('../db/sql_runner')

class Loan


def initialize(options)
  @id = options['id'].to_i if options['id']
  @member_id = options['member_id']
  @book_id = options['book_id']
  @due_back = options['due_back']
end



##
end
