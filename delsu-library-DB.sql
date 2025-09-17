-- create db
CREATE DATABASE IF NOT EXISTS libraryDB;
USE libraryDB;

-- create table for libray staff and school student
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    member_type ENUM('Student', 'Staff') NOT NULL
);

-- books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INT,
    isbn VARCHAR(20) NOT NULL UNIQUE
);

-- publishers table
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(200) NOT NULL UNIQUE,
    country VARCHAR(100)
);

-- SQL Database Schema for a School Library Management System 📚
Here is the complete SQL script to create a relational database for a school library management system. The design includes well-structured tables, proper constraints, and the relationships necessary to manage books, members, and borrowings efficiently.

1. Database Creation
This command creates the new database named school_library.

SQL

CREATE DATABASE IF NOT EXISTS school_library;
USE school_library;
2. Table Creation and Constraints
Members Table
This table stores information about each library member (students and staff).

member_id: Primary key for the table.

first_name, last_name: Essential member details.

email: A unique identifier for each member.

member_type: Defines if the member is a 'Student' or 'Staff'.

SQL

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    member_type ENUM('Student', 'Staff') NOT NULL
);
Books Table
This table stores details about all the books in the library.

book_id: Primary key for the table.

title, author, publication_year: Core book attributes.

isbn: A unique identifier for each book.

SQL

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INT,
    isbn VARCHAR(20) NOT NULL UNIQUE
);
-- Publishers Table
-- This table stores information about the publishers of the books. This design creates a One-to-Many relationship between a Publisher and Books.

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(200) NOT NULL UNIQUE,
    country VARCHAR(100)
);

-- Book_Copies Table
-- This table tracks individual physical copies of a book. 
-- This creates a One-to-Many relationship between a Book and its Book_Copies

-- Borrowing table
--  It records each time a member borrows a specific book copy.
-- This table demonstrate a Many-to-Many relationship between Members and Book_Copies
CREATE TABLE Borrowings (
    borrowing_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    copy_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (copy_id) REFERENCES Book_Copies(copy_id) ON DELETE CASCADE,
    UNIQUE (copy_id, return_date) -- Ensures a copy can only be borrowed once at a time
);

