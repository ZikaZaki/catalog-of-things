/** Create the database */


/** Create the tables */
CREATE TABLE games(
    id INT GENERATED ALWAYS AS IDENTITY,
    last_played_date DATE,
    published_date DATE,
    multiplayer BOOLEAN,
    PRIMARY KEY(id)
);
CREATE TABLE authors(
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY(id)
);