CREATE DATABASE library_db;

USE library_db;

CREATE TABLE books (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100),
    title VARCHAR(100),
    author VARCHAR(100),
    publish_year INT,
    genre VARCHAR(50)
);
