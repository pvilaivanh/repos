#!/bin/bash

docker exec -i mydb psql -U postgres <<EOF

CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT,
  age INT
);

ALTER TABLE users ADD COLUMN IF NOT EXISTS age INT;

INSERT INTO users (name, email, age)
VALUES 
('David', 'david@test.com', 25),
('Emma', 'emma@test.com', 30),
('Frank', 'frank@test.com', 28)
ON CONFLICT DO NOTHING;

EOF
