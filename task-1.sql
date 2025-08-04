library-management-system

CREATE DATABASE Librarymanagementsystem;
USE Librarymanagementsystem;

Create Publisher table
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255)
);

Create Author table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Bio TEXT
);

Create Book table
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150),
    ISBN VARCHAR(20) UNIQUE,
    PublisherID INT,
    YearPublished INT,
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

Create Member table
CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    JoinDate DATE
);

Create Loan table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

Create BookAuthor table (junction table for many-to-many)
CREATE TABLE BookAuthor (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);



