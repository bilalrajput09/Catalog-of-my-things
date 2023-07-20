CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  archived BOOLEAN NOT NULL,
  cover_state VARCHAR(255) NOT NULL,
  label_id INTEGER REFERENCES labels(id),
  genre_id INTEGER REFERENCES genres(id),
  author_id INTEGER REFERENCES authors(id)
);
