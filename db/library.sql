DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;

CREATE TABLE books(
  id SERIAL2 PRIMARY KEY,
  image VARCHAR(255),
  title VARCHAR(255),
  author VARCHAR(255),
  illustrator VARCHAR(255),
  age_range VARCHAR(255),
  checked_out VARCHAR(255)
);

CREATE TABLE members(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE loans(
  id SERIAL4 PRIMARY KEY,
  member_id INT2 REFERENCES members(id) ON DELETE CASCADE,
  book_id INT2 REFERENCES books(id) ON DELETE CASCADE,
  due_back DATE
);
