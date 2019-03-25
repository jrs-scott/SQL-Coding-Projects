USE db_library

CREATE TABLE Library_Branch (
    BranchID INT PRIMARY KEY IDENTITY (100,1) NOT NULL,
    BranchName VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL
);

CREATE TABLE Publisher (
	PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
    Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(20)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Title VARCHAR(100) NOT NULL,
    PublisherName VARCHAR(100) NOT NULL CONSTRAINT fk_Books FOREIGN KEY (PublisherName) REFERENCES Publisher(PublisherName)
);

CREATE TABLE Book_Authors (
    BookID INT NOT NULL CONSTRAINT fk_Book_Authors FOREIGN KEY (BookID) REFERENCES Books(BookID),
    AuthorName VARCHAR(100) NOT NULL
);

CREATE TABLE Book_Copies (
    BookID INT NOT NULL CONSTRAINT fk_Book_Copies FOREIGN KEY (BookID) REFERENCES Books(BookID),
    BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID),
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE Borrower (
    CardNo INT PRIMARY KEY IDENTITY (1000,1) NOT NULL,
	Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(20)
);

CREATE TABLE Book_Loans (
    BookID INT NOT NULL CONSTRAINT fk_Book_Loans FOREIGN KEY (BookID) REFERENCES Books(BookID),
    BranchID INT NOT NULL CONSTRAINT fk_BL_BranchID FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID),
	CardNo INT NOT NULL  CONSTRAINT fk_CardNo FOREIGN KEY (CardNo) REFERENCES Borrower(CardNo),
	DateOut VARCHAR(20) NOT NULL,
	DateDue VARCHAR(20) NOT NULL
);

INSERT INTO Library_Branch(BranchName, Address)
	VALUES 
	('Sharpstown', '1234 New Drive'),
	('Central', '4567 Oak Street'),
	('Willow Peak', '3948 Walters Ave'),
	('Glenmore', '4862 Sandy Lane')
;

INSERT INTO Publisher(PublisherName, Address, Phone)
	VALUES 
	('Viking Press', '41 Big Rock Cove', '202-555-0144'),
	('Labrys Press', '7185 Arch Avenue', '562-555-0136'),
	('Microcosum Publishing', '53 Greenrose Street', '437-555-0103'),
	('Craigmore Creations', '9675A Pineknoll Street', '503-555-0116')
;

INSERT INTO Books(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Viking Press'),
	('The Copper Locket', 'Labrys Press'),
	('Strike the Oath', 'Labrys Press'),
	('Taste of Heaven', 'Microcosum Publishing'),
	('The Haunted Portrait', 'Craigmore Creations'),
	('Something Gained', 'Microcosum Publishing'),
	('The Titan in the Winter', 'Viking Press'),
	('Kingdom of Argus', 'Labrys Press'),
	('Paladin''s Tribute', 'Labrys Press'),
	('The Sun of the Orb', 'Craigmore Creations'),
	('Fallen Vice', 'Microcosum Publishing'),
	('Drawing for Beginners', 'Craigmore Creations'),
	('It''s About Time', 'Craigmore Creations'),
	('Mystery of the Pale Conductor', 'Labrys Press'),
	('Vegan Cook Book', 'Craigmore Creations'),
	('It', 'Viking Press'), 
	('Pet Semetary', 'Viking Press'), 
	('The Stand', 'Viking Press'),
	('Misery', 'Viking Press'),
	('Cujo', 'Viking Press')
;

INSERT INTO Book_Authors(BookID, AuthorName)
	VALUES
	(1, 'Dan Marino'),
	(2, 'Ed Stevens'),
	(3, 'Desiree Ficker'),
	(4, 'Talita Antunes'),
	(5, 'Anna Kournikova'),
	(6, 'John McEnroe'),
	(7, 'Natalie Gulbis'),
	(8, 'Wayne Gretzky'),
	(9, 'Mario Lemieux'),
	(10, 'Romy Müller'),
	(11, 'Martina Glagow'),
	(12, 'Charles Austin'),
	(13, 'Wayne Gretzky'),
	(14, 'Mario Lemieux'),
	(15, 'Talita Antunes'),
	(16, 'Stephen King'),
	(17, 'Stephen King'),
	(18, 'Stephen King'),
	(19, 'Stephen King'),
	(20, 'Stephen King')
;

INSERT INTO Book_Copies(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1, 100, 2),
	(2, 101, 3),
	(3, 102, 2),
	(4, 103, 3),
	(5, 101, 2),
	(6, 102, 4),
	(7, 103, 3),
	(8, 100, 2),
	(9, 101, 3),
	(10, 102, 2),
	(11, 103, 4),
	(12, 100, 2),
	(13, 101, 2),
	(14, 102, 2),
	(15, 103, 3),
	(16, 100, 3),
	(17, 101, 4),
	(18, 102, 2),
	(19, 103, 2),
	(20, 100, 5),
	(1, 101, 2),
	(2, 102, 3),
	(3, 103, 2),
	(4, 100, 3),
	(5, 101, 2),
	(6, 102, 4),
	(7, 103, 3),
	(8, 100, 2),
	(9, 101, 3),
	(10, 102, 2),
	(11, 103, 4),
	(12, 100, 2),
	(13, 101, 2),
	(14, 102, 2),
	(15, 103, 3),
	(16, 100, 3),
	(20, 101, 3),
	(18, 102, 2),
	(19, 103, 2),
	(20, 100, 5)
;

INSERT INTO Book_Loans(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1, 100, 1000, '2019/25/02', '2019/25/03'),
	(2, 100, 1000, '2019/25/02', '2019/25/03'),
	(3, 100, 1000, '2019/25/02', '2019/25/03'),
	(4, 100, 1000, '2019/03/01', '2019/04/01'),
	(5, 100, 1000, '2019/03/01', '2019/04/01'),
	(6, 100, 1000, '2019/03/01', '2019/04/01'),
	(7, 100, 1000, '2019/03/01', '2019/04/01'),
	(8, 100, 1000, '2019/03/01', '2019/04/01'),
	(9, 100, 1000, '2019/03/01', '2019/04/01'),
	(10, 100, 1000, '2019/25/02', '2019/25/03'),
	(11, 101, 1001, '2019/03/12', '2019/04/12'), 
	(12, 101, 1001, '2019/03/12', '2019/04/12'),
	(13, 101, 1001, '2019/03/12', '2019/04/12'),
	(14, 101, 1001, '2019/03/12', '2019/04/12'),
	(15, 101, 1001, '2019/03/12', '2019/04/12'),
	(16, 101, 1001, '2019/03/12', '2019/04/12'),
	(17, 101, 1001, '2019/03/12', '2019/04/12'),
	(18, 101, 1001, '2019/03/12', '2019/04/12'),
	(19, 101, 1001, '2019/03/12', '2019/04/12'),
	(20, 101, 1001, '2019/03/12', '2019/04/12'),
	(19, 102, 1002, '2019/01/05', '2019/02/05'),
	(18, 102, 1002, '2019/01/05', '2019/02/05'),
	(17, 102, 1002, '2019/01/05', '2019/02/05'),
	(16, 102, 1002, '2019/01/05', '2019/02/05'),
	(15, 102, 1002, '2019/01/05', '2019/02/05'),
	(14, 102, 1002, '2019/01/05', '2019/02/05'),
	(13, 102, 1002, '2019/01/05', '2019/02/05'),
	(12, 102, 1002, '2019/01/05', '2019/02/05'),
	(11, 103, 1000, '2019/01/05', '2019/02/05'),
	(10, 103, 1000, '2019/01/05', '2019/02/05'),
	(9, 103, 1009, '2019/02/08', '2019/03/03'),
	(8, 103, 1009, '2019/02/08', '2019/03/03'),
	(7, 103, 1009, '2019/02/08', '2019/03/03'),
	(6, 103, 1009, '2019/02/08', '2019/03/03'),
	(5, 103, 1009, '2019/02/08', '2019/03/03'),
	(4, 100, 1009, '2019/25/02', '2019/25/03'),
	(3, 100, 1009, '2019/02/08', '2019/03/03'),
	(2, 100, 1009, '2019/02/08', '2019/03/03'),
	(1, 100, 1009, '2019/02/08', '2019/03/03'),
	(12, 102, 1008, '2019/03/20', '2019/04/20'),
	(13, 102, 1008, '2019/03/20', '2019/04/20'),
	(14, 102, 1008, '2019/03/20', '2019/04/20'),
	(15, 103, 1007, '2019/03/20', '2019/04/20'),
	(16, 103, 1007, '2019/03/20', '2019/04/20'),
	(17, 100, 1007, '2019/03/20', '2019/04/20'),
	(18, 100, 1006, '2019/03/20', '2019/04/20'),
	(19, 103, 1005, '2019/03/20', '2019/04/20'),
	(11, 102, 1004, '2019/03/20', '2019/04/20'),
	(10, 102, 1004, '2019/03/20', '2019/04/20'),
	(1, 101, 1008, '2019/03/20', '2019/04/20')
;

INSERT INTO Borrower(Name, Address, Phone)
	VALUES
	('Kimberley Smith', '279 Fairview Dr.', '277-780-5246'),
	('Wayne Rooney', '7987 Southampton St.', '741-879-5979'),
	('Stan Musial', '90 Bayberry Ave.', '480-903-3161'),
	('Adriana Behar', '605 Devonshire Dr.', '800-695-2773'),
	('Sally McLellan', '395 Forest Ave.', '347-702-1885'),
	('Alison Williamson', '59 Euclid St.', '884-550-3322'),
	('Lilli Schwarzkopf', '492 Princess St.', '764-822-9029'),
	('Susanne Glesnes', '9492 Devon St.', '239-890-0248'),
	('Ted Williams', '8120 Laurel St. ', '866-424-3109'),
	('Astrid Kumbernuss', '810 York St.', '922-782-7087')
;


/* Query 1 */
SELECT Title, BranchName, Number_Of_Copies FROM ((Book_Copies 
	INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID)
	INNER JOIN Books ON Book_Copies.BookID = Books.BookID)
	WHERE Book_Copies.BranchID = 100 AND Book_Copies.BookID = 1	
;

/* Query 2 */
SELECT Title, BranchName, Number_Of_Copies FROM ((Book_Copies 
	INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID)
	INNER JOIN Books ON Book_Copies.BookID = Books.BookID)
	WHERE Book_Copies.BookID = 1	
;

/* Query 3 */
SELECT Name FROM Borrower
	LEFT JOIN Book_Loans
	ON Book_Loans.CardNo = Borrower.CardNo
	WHERE Book_Loans.CardNo IS NULL
;

/* Query 4 */
SELECT Title, Name, Address FROM ((Book_Loans
		INNER JOIN Books ON Books.BookID = Book_Loans.BookID)
		INNER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo)
		WHERE Book_Loans.BranchID = 100 AND Book_Loans.DateDue = '2019/25/03'
;

/* Query 5 */
SELECT BranchName, count(BookID) 'Books Checked Out' FROM (Library_Branch
	INNER JOIN Book_Loans ON Book_Loans.BranchID = Library_Branch.BranchID)
	GROUP BY Library_Branch.BranchName
;

/* Query 6 */
SELECT Name, Address, count(BookID) 'Books Checked Out' FROM Book_Loans
	INNER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo
	GROUP BY Borrower.Name, Borrower.Address
	HAVING count(BookID) > 5
;

/* QUERY 7 */
SELECT Title, sum(Number_Of_Copies) 'Number of Copies' FROM ((Book_Copies
	INNER JOIN Book_Authors ON Book_Copies.BookID = Book_Authors.BookID)
	INNER JOIN Books ON Books.BookID = Book_Copies.BookID)
	WHERE BranchID = 101
	GROUP BY Books.Title, Book_Copies.Number_Of_Copies, Book_Authors.AuthorName
	HAVING Book_Authors.AuthorName = 'Stephen King'
;