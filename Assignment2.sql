

CREATE DATABASE Assignment
USE Assignment;


CREATE TABLE Publisher
(
    PID INT PRIMARY KEY,
    PublisherName NVARCHAR(50) UNIQUE NOT NULL
);


INSERT INTO Publisher VALUES (1, 'Shrma ji publication');
INSERT INTO Publisher VALUES (2, 'Verma ji publication');
INSERT INTO Publisher VALUES (3, 'Aggrawal Publication');


CREATE TABLE Category
(
    CID INT PRIMARY KEY,
    CategoryName NVARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO Category VALUES (1, 'Science');
INSERT INTO Category VALUES (2, 'Maths');
INSERT INTO Category VALUES (3, 'English');


CREATE TABLE Author
(
    AID INT PRIMARY KEY,
    AuthorName NVARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO Author VALUES (1, 'Pradeep Sharma');
INSERT INTO Author VALUES (2, 'Aniket Verma');
INSERT INTO Author VALUES (3, 'Sachin Aggarwal');


CREATE TABLE Book (
    BID INT PRIMARY KEY,
    BName NVARCHAR(50) NOT NULL,
    BPrice DECIMAL(10, 2) NOT NULL,
    Author INT,
    Publisher INT,
    Category INT,
    FOREIGN KEY (Author) REFERENCES Author(AID),
    FOREIGN KEY (Publisher) REFERENCES Publisher(PID),
    FOREIGN KEY (Category) REFERENCES Category(CID)
);


INSERT INTO Book VALUES (1, 'Rd Shrma', 12.99, 1, 1, 1);
INSERT INTO Book VALUES (2, 'RS Aggerwal', 19.99, 2, 2, 2);
INSERT INTO Book VALUES (3, 'Pradeep', 15.99, 3, 3, 2);


SELECT B.BID, B.BName, B.BPrice, A.AuthorName, P.PublisherName, C.CategoryName
FROM Book AS B
JOIN Author AS A ON B.Author = A.AID
JOIN Publisher AS P ON B.Publisher = P.PID
JOIN Category AS C ON B.Category = C.CID;

