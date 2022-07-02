CREATE DATABASE if not exists social_app;
USE social_app;
DROP TABLE if exists comments;
DROP TABLE if exists posts;
DROP TABLE if exists users;
CREATE TABLE users (
	username VARCHAR(16) UNIQUE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL,
    password VARCHAR(20) NOT NULL,
    date_of_birth DATE,
	PRIMARY KEY (username)
);
CREATE TABLE posts (
	post_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(16) NOT NULL,
    post_content VARCHAR(400) NOT NULL,
    post_time TIMESTAMP,
    PRIMARY KEY (post_id),
    FOREIGN KEY (username) REFERENCES users (username)
);
CREATE TABLE comments (
	comment_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(16) NOT NULL,
    post_id INT NOT NULL,
    comment_content VARCHAR(400) NOT NULL,
    comment_time TIMESTAMP,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (username) REFERENCES users (username),
    FOREIGN KEY (post_id) REFERENCES posts (post_id)
);