require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      # db = PG.connect({dbname: 'library', host: 'localhost'})

      db = PG.connect( {dbname: 'db5092thif0q3v',
        host: 'ec2-107-20-193-206.compute-1.amazonaws.com',
        port: 5432, user: 'cxxfoolynylooz', password: 'a9c4e7219120f2c4e605677d7bc5e152e8a00b1a7671dfdc90b9269fb40b588e'})

      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
