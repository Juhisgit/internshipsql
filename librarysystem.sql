create database internship;
use internship;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(50),
    AvailableCopies INT
);

-- Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
-- Insert into Books
INSERT INTO Books (BookID, Title, Author, Genre, AvailableCopies)
VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 5),
(2, '1984', 'George Orwell', 'Dystopian', 3),
(3, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 4);

-- Insert into Members
INSERT INTO Members (MemberID, Name, Address, PhoneNumber, Email)
VALUES
(1, 'John Doe', '123 Library Lane', '1234567890', 'johndoe@example.com'),
(2, 'Jane Smith', '456 Book Blvd', '9876543210', 'janesmith@example.com');

-- Insert into Transactions
INSERT INTO Transactions (TransactionID, MemberID, BookID, BorrowDate, ReturnDate)
VALUES
(1, 1, 2, '2024-12-01', NULL),
(2, 2, 3, '2024-12-02', '2024-12-05');
SELECT * FROM Books;

-- Find books borrowed by a specific member
SELECT m.Name, b.Title, t.BorrowDate
FROM Transactions t
JOIN Members m ON t.MemberID = m.MemberID
JOIN Books b ON t.BookID = b.BookID
WHERE m.Name = 'John Doe';

-- Update book availability after a borrow
UPDATE Books
SET AvailableCopies = AvailableCopies - 1
WHERE BookID = 2;

-- Return a book and update availability
UPDATE Transactions
SET ReturnDate = '2024-12-08'
WHERE TransactionID = 1;

UPDATE Books
SET AvailableCopies = AvailableCopies + 1
WHERE BookID = 2;