#!/bin/bash

docker exec -i mydb psql -U postgres <<EOF

CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT
);

INSERT INTO users (name, email)
VALUES ('Charlie', 'charlie@test.com')
ON CONFLICT DO NOTHING;

EOF
