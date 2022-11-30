CREATE TABLE tbl_user_genre (
	username VARCHAR(20) NOT NULL,
    genre_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (username, genre_id)
);