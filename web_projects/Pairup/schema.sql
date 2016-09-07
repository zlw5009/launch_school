CREATE TABLE users (
  id serial PRIMARY KEY,
  name text NOT NULL,
  password varchar NOT NULL
);

CREATE TABLE challenges (
  id serial PRIMARY KEY,
  name text NOT NULL,
  description text NOT NULL,
  start_date date NOT NULL,
  end_date date NOT NULL
);

CREATE TABLE users_challenges (
  id serial PRIMARY KEY,
  users_id integer NOT NULL REFERENCES users (id),
  challenges_id integer NOT NULL REFERENCES challenges (id)
);