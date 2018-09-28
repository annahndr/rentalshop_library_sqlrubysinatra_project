require_relative('../db/sql_runner')

class Member

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['options']
  @email = options['email']
end

##
end
