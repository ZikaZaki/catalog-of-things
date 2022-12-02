/** Create the database */
CREATE DATABASE IF NOT EXISTS `catalog_of_things` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE Genres (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Authors (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(250) NOT NULL,
    last_name VARCHAR(250) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Labels (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(250) NOT NULL,
    color VARCHAR(250) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Sources (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Books (
    id INT NOT NULL AUTO_INCREMENT,
    publish_date DATE NOT NULL,
    publisher VARCHAR(250) NOT NULL,
    cover_state VARCHAR(100) NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT NOT NULL,
    author_id INT NOT NULL,
    label_id INT NOT NULL,
    source_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id),
    FOREIGN KEY (author_id) REFERENCES Authors(id),
    FOREIGN KEY (label_id) REFERENCES Labels(id),
    FOREIGN KEY (source_id) REFERENCES Sources(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Movies (
    id INT NOT NULL AUTO_INCREMENT,
    publish_date DATE NOT NULL,
    silent BOOLEAN NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT NOT NULL,
    author_id INT NOT NULL,
    label_id INT NOT NULL,
    source_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id),
    FOREIGN KEY (author_id) REFERENCES Authors(id),
    FOREIGN KEY (label_id) REFERENCES Labels(id),
    FOREIGN KEY (source_id) REFERENCES Sources(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE MusicAlbums (
    id INT NOT NULL AUTO_INCREMENT,
    publish_date DATE NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT NOT NULL,
    author_id INT NOT NULL,
    label_id INT NOT NULL,
    source_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id),
    FOREIGN KEY (author_id) REFERENCES Authors(id),
    FOREIGN KEY (label_id) REFERENCES Labels(id),
    FOREIGN KEY (source_id) REFERENCES Sources(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Games (
    id INT NOT NULL AUTO_INCREMENT,
    publish_date DATE NOT NULL,
    multiplayer BOOLEAN NOT NULL,
    last_played DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT NOT NULL,
    author_id INT NOT NULL,
    label_id INT NOT NULL,
    source_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id),
    FOREIGN KEY (author_id) REFERENCES Authors(id),
    FOREIGN KEY (label_id) REFERENCES Labels(id),
    FOREIGN KEY (source_id) REFERENCES Sources(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
