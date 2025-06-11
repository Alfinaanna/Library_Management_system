
CREATE DATABASE library;
USE library;

-- Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Books Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Sample Insert Statements
INSERT INTO Branch VALUES
(101, 1, 'Delhi', '0111234567'),
(102, 2, 'Mumbai', '0229876543');

INSERT INTO Employee VALUES
(1, 'Ravi Kumar', 'Manager', 65000, 101),
(2, 'Anjali Singh', 'Librarian', 45000, 101),
(3, 'Kiran Joshi', 'Manager', 62000, 102),
(4, 'Pooja Mehta', 'Assistant', 30000, 102),
(5, 'Rahul Roy', 'Staff', 55000, 102),
(6, 'Arun Das', 'Staff', 58000, 101);

INSERT INTO Books VALUES
('ISBN001', 'Indian History', 'History', 30, 'Yes', 'R.C. Majumdar', 'Pearson'),
('ISBN002', 'Python Programming', 'Technology', 40, 'No', 'Mark Lutz', 'O’Reilly'),
('ISBN003', 'World War II', 'History', 25, 'Yes', 'Winston Churchill', 'Penguin'),
('ISBN004', 'Database Systems', 'Education', 35, 'Yes', 'C.J. Date', 'McGraw Hill');

INSERT INTO Customer VALUES
(101, 'Sana Sharma', 'Chennai', '2021-12-10'),
(102, 'Amit Verma', 'Delhi', '2023-02-15'),
(103, 'Neha Rathi', 'Pune', '2020-07-21'),
(104, 'Vikram Thakur', 'Hyderabad', '2023-06-10');

INSERT INTO IssueStatus VALUES
(1, 102, 'Python Programming', '2023-06-12', 'ISBN002'),
(2, 104, 'Indian History', '2023-06-25', 'ISBN001');

INSERT INTO ReturnStatus VALUES
(1, 102, 'Python Programming', '2023-06-20', 'ISBN002');
