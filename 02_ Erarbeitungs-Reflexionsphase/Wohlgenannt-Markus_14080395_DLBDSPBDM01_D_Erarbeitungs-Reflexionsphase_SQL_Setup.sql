-- Creates the Schema for the Tables
CREATE SCHEMA `dbo`;

-- Table for storing addresses
CREATE TABLE dbo.tbl_addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(60),
    city VARCHAR(60),
    postal_code VARCHAR(10),
    country VARCHAR(60),
    description VARCHAR(50),
    deleted BOOLEAN DEFAULT FALSE
);

-- Insert data into dbo.tbl_addresses
INSERT INTO dbo.tbl_addresses (street, city, postal_code, country, description) VALUES
('Wunschlistadresse 1', 'Bregenz', '6800', 'Österreich', 'Wunschliste'),
('Bahnhofstraße 1', 'Bregenz', '6900', 'Österreich', 'Wohnadresse'),
('Dorfstraße 2', 'Dornbirn', '6850', 'Österreich', 'Wohnadresse'),
('Hauptstraße 3', 'Feldkirch', '6800', 'Österreich', 'Wohnadresse'),
('Landstraße 4', 'Bludenz', '6700', 'Österreich', 'Wohnadresse'),
('Seestraße 5', 'Hard', '6971', 'Österreich', 'Wohnadresse'),
('Kirchplatz 6', 'Hohenems', '6845', 'Österreich', 'Bücherbox'),
('Gartenweg 7', 'Lustenau', '6890', 'Österreich', 'Bücherbox'),
('Alte Straße 8', 'Götzis', '6840', 'Österreich', 'Bücherbox'),
('Müllergasse 9', 'Rankweil', '6830', 'Österreich', 'Bücherbox'),
('Bergstraße 10', 'Wolfurt', '6922', 'Österreich', 'Bücherbox'),
('Schulstraße 11', 'Bregenz', '6900', 'Österreich', 'Bücherbox'),
('Parkstraße 12', 'Dornbirn', '6850', 'Österreich', 'Bücherbox'),
('Bibliotheksweg 13', 'Feldkirch', '6800', 'Österreich', 'Bücherbox'),
('Rathausplatz 14', 'Bludenz', '6700', 'Österreich', 'Bücherbox'),
('Museumsstraße 15', 'Hohenems', '6845', 'Österreich', 'Bücherbox');

-- Table for storing book boxes, describes where the Boxes are stored.
CREATE TABLE dbo.tbl_boxes (
    box_id INT AUTO_INCREMENT PRIMARY KEY,
    address_id INT,
    description VARCHAR(255),
    deleted BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_box_address FOREIGN KEY (address_id) REFERENCES dbo.tbl_addresses(address_id)
);

-- Insert data into tbl_boxes
INSERT INTO dbo.tbl_boxes (address_id, description) VALUES
(5, 'Lagerbox vor der Schule'),
(6, 'Lagerbox neben dem Park'),
(7, 'Lagerbox bei der Bibliothek'),
(8, 'Lagerbox hinter dem Rathaus'),
(9, 'Lagerbox beim Museum'),
(10, 'Lagerbox an der Kirche'),
(11, 'Lagerbox am Marktplatz'),
(12, 'Lagerbox am Flussufer'),
(13, 'Lagerbox auf dem Hügel'),
(14, 'Lagerbox am Stadtrand'),
(15, 'Lagerbox am Seeufer');

-- Table for storing user information
CREATE TABLE dbo.tbl_user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(50),
    address_id INT,
    birth_date DATE,
    deleted BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_user_address FOREIGN KEY (address_id) REFERENCES dbo.tbl_addresses(address_id)
);

-- Insert data into dbo.tbl_user
INSERT INTO dbo.tbl_user (first_name, last_name, email, phone_number, address_id, birth_date) VALUES
('Max', 'Mustermann', 'max.mustermann@example.com', '0664-1234567', 6, '1990-01-01'),
('Erika', 'Mustermann', 'erika.mustermann@example.com', '0664-2345678', 6, '1985-02-02'),
('Hans', 'Müller', 'hans.mueller@example.com', '0664-3456789', 2, '1995-03-03'),
('Anna', 'Müller', 'anna.mueller@example.com', '0664-6789012', 2, '1991-06-06'),
('Petra', 'Schmidt', 'petra.schmidt@example.com', '0664-4567890', 3, '1980-04-04'),
('Sebastian', 'Schmidt', 'sebastian.schmidt@example.com', '0664-9012345', 3, '1988-09-09'),
('Thomas', 'Bauer', 'thomas.bauer@example.com', '0664-5678901', 4, '1992-05-05'),
('Markus', 'Bauer', 'markus.bauer@example.com', '0664-7890123', 4, '1987-07-07'),
('Julia', 'Weber', 'julia.weber@example.com', '0664-8901234', 5, '1993-08-08'),
('Laura', 'Weber', 'laura.weber@example.com', '0664-0123456', 5, '1994-10-10'),
('Wunsch', 'Benutzer', 'wunsch.benutzer@example.com', '0664-0000000', 1, '2000-01-01');

-- Table for storing book categories
CREATE TABLE dbo.tbl_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    deleted BOOLEAN DEFAULT FALSE
);

-- Insert data into tbl_categories
INSERT INTO dbo.tbl_categories (name) VALUES
('Krimi'),
('Fantasy'),
('Science-Fiction'),
('Kochen'),
('Reise'),
('Kunst'),
('Psychologie'),
('Philosophie'),
('Thriller'),
('Politik');

-- Table for storing languages
CREATE TABLE dbo.tbl_languages (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_code CHAR(2),
    language_name VARCHAR(50),
    deleted BOOLEAN DEFAULT FALSE
);

-- Insert data into tbl_languages
INSERT INTO dbo.tbl_languages (language_code, language_name) VALUES
('DE', 'Deutsch'),
('EN', 'Englisch'),
('FR', 'Französisch'),
('ES', 'Spanisch'),
('IT', 'Italienisch'),
('RU', 'Russisch'),
('PT', 'Portugiesisch'),
('NL', 'Niederländisch'),
('SV', 'Schwedisch'),
('PL', 'Polnisch');

-- Table for storing authors
CREATE TABLE dbo.tbl_authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    origin VARCHAR(50),
    language_id INT,
    deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (language_id) REFERENCES dbo.tbl_languages(language_id)
);

-- Insert data into dbo.tbl_authors
	INSERT INTO dbo.tbl_authors (first_name, last_name, origin, language_id) VALUES
	('Franz', 'Kafka', 'Austria', 1),
	('Johann Wolfgang', 'von Goethe', 'Germany', 1),
	('Friedrich', 'Schiller', 'Germany', 1),
	('Hermann', 'Hesse', 'Germany', 1),
	('Thomas', 'Mann', 'Germany', 1),
	('Leo', 'Tolstoy', 'Russia', 1),
	('Fyodor', 'Dostoevsky', 'Russia', 1),
	('William', 'Shakespeare', 'England', 2),
	('Jane', 'Austen', 'England', 2),
	('Charles', 'Dickens', 'England', 2),
	('Aldous', 'Huxley', 'United Kingdom', 2);

-- Table for storing book information
CREATE TABLE dbo.tbl_book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    publication_year INT,
    isbn VARCHAR(17),
    category_id INT,
    read_status BOOLEAN DEFAULT FALSE,
    deleted BOOLEAN DEFAULT FALSE,
    language_id INT,
    owner_id INT,
    author_id INT,
    address_id INT,
    FOREIGN KEY (language_id) REFERENCES dbo.tbl_languages(language_id),
    FOREIGN KEY (category_id) REFERENCES dbo.tbl_categories(category_id),
    FOREIGN KEY (owner_id) REFERENCES dbo.tbl_user(user_id),
    FOREIGN KEY (author_id) REFERENCES dbo.tbl_authors(author_id),
    FOREIGN KEY (address_id) REFERENCES dbo.tbl_addresses(address_id)
);

-- Insert data into tbl_book
INSERT INTO dbo.tbl_book (title, publication_year, isbn, category_id, language_id, owner_id, author_id, address_id) VALUES
('Brave New World', 1932, '9780060850524', 3, 2, 11, 11, 1),
('The Trial', 1925, '9783150000113', 9, 1, 1, 1, 1),
('The Metamorphosis', 1915, '9783150000120', 2, 1, 2, 1, 2),
('Faust', 1808, '9783150000137', 8, 1, 3, 2, 3),
('Die Leiden des jungen Werthers', 1774, '9783150000144', 1, 1, 4, 2, 4),
('Die Räuber', 1781, '9783150000151', 9, 1, 5, 3, 5),
('Siddhartha', 1922, '9783150000168', 7, 1, 6, 4, 6),
('Der Steppenwolf', 1927, '9783150000175', 8, 1, 7, 4, 7),
('Der Zauberberg', 1924, '9783150000182', 3, 1, 8, 5, 8),
('Buddenbrooks', 1901, '9783150000199', 10, 1, 9, 5, 9),
('War and Peace', 1869, '9783150000205', 5, 1, 10, 6, 10);

-- Table for storing book borrowing records
CREATE TABLE dbo.tbl_borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES dbo.tbl_user(user_id),
    FOREIGN KEY (book_id) REFERENCES dbo.tbl_book(book_id)
);

-- Insert data into tbl_borrowings
INSERT INTO dbo.tbl_borrowings (user_id, book_id, borrow_date, return_date) VALUES
(1, 6, '2024-06-01', '2024-06-06'),
(2, 4, '2024-06-02', '2024-06-12'),
(3, 3, '2024-06-03', '2024-06-07'),
(4, 2, '2024-06-04', '2024-06-19'),
(5, 5, '2024-06-05', '2024-06-15'),
(1, 6, '2024-06-06', '2024-06-20'),
(2, 7, '2024-06-07', '2024-06-17'),
(3, 8, '2024-06-08', '2024-06-18'),
(4, 9, '2024-06-09', '2024-06-14'),
(5, 10, '2024-06-10', '2024-06-20');

-- Table for storing book reservation records
CREATE TABLE dbo.tbl_reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    reservation_date DATE,
    status VARCHAR(50),
    deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES dbo.tbl_user(user_id),
    FOREIGN KEY (book_id) REFERENCES dbo.tbl_book(book_id)
);

-- Insert data into tbl_reservations
INSERT INTO dbo.tbl_reservations (user_id, book_id, reservation_date,status) VALUES
(1, 6, '2024-06-01','offen'),
(2, 7, '2024-06-02','offen'),
(3, 5, '2024-06-03','offen'),
(4, 5, '2024-06-04','abgeschlossen'),
(5, 2, '2024-06-05','abgeschlossen'),
(1, 7, '2024-06-06','abgeschlossen'),
(2, 8, '2024-06-07','abgeschlossen'),
(3, 9, '2024-06-08','abgebrochen'),
(4, 10, '2024-06-09','offen'),
(5, 10, '2024-06-10','offen');

-- Table for storing book ratings
CREATE TABLE dbo.tbl_ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    rating INT,
    comment TEXT,
    rating_date DATE,
    deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES dbo.tbl_user(user_id),
    FOREIGN KEY (book_id) REFERENCES dbo.tbl_book(book_id)
);

-- Insert data into tbl_ratings
INSERT INTO dbo.tbl_ratings (user_id, book_id, rating, comment, rating_date) VALUES
(1, 2, 5, 'Ein Meisterwerk!', '2024-01-15'),
(2, 6, 4, 'Spannende Handlung.', '2024-01-20'),
(3, 7, 4, 'Sehr gut geschrieben.', '2024-02-15'),
(4, 2, 3, 'Interessante Charaktere.', '2024-02-20'),
(5, 3, 3, 'Gute Unterhaltung.', '2024-03-15'),
(1, 3, 2, 'Etwas langatmig.', '2024-03-20'),
(2, 4, 8, 'Konnte mich nicht überzeugen.', '2024-04-15'),
(3, 4, 7, 'Schwache Handlung.', '2024-04-20'),
(4, 5, 6, 'Hat mir nicht gefallen.', '2024-05-15'),
(5, 5, 3, 'Interessante Ideen.', '2024-05-20');

-- Table for logging changes in book position
CREATE TABLE dbo.tbl_position_log (
    position_log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    log_date DATE,
    previous_address_id INT,
    new_address_id INT,
    FOREIGN KEY (user_id) REFERENCES dbo.tbl_user(user_id),
    FOREIGN KEY (book_id) REFERENCES dbo.tbl_book(book_id),
    FOREIGN KEY (previous_address_id) REFERENCES dbo.tbl_addresses(address_id),
    FOREIGN KEY (new_address_id) REFERENCES dbo.tbl_addresses(address_id)
);

-- Insert data into tbl_position_log
INSERT INTO dbo.tbl_position_log (user_id, book_id, log_date, previous_address_id, new_address_id) VALUES
(1, 6, '2024-06-01', 1, 2),
(2, 2, '2024-06-03', 2, 3),
(3, 3, '2024-06-05', 3, 4),
(4, 4, '2024-06-07', 4, 5),
(5, 5, '2024-06-09', 5, 6),
(1, 7, '2024-06-11', 2, 3),
(2, 2, '2024-06-13', 3, 4),
(3, 3, '2024-06-15', 4, 5),
(4, 4, '2024-06-17', 5, 6),
(5, 5, '2024-06-19', 6, 7);

-- Table for logging changes in book read statuses
CREATE TABLE dbo.tbl_read_status_log (
    read_status_log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    previous_read_status BOOLEAN,
    new_read_status BOOLEAN,
    log_date DATE,
    FOREIGN KEY (user_id) REFERENCES dbo.tbl_user(user_id),
    FOREIGN KEY (book_id) REFERENCES dbo.tbl_book(book_id)
);

-- Insert data into tbl_read_status_log
INSERT INTO dbo.tbl_read_status_log (user_id, book_id, previous_read_status, new_read_status, log_date) VALUES
(2, 3, FALSE, TRUE, '2024-06-02'),
(3, 6, FALSE, TRUE, '2024-06-03'),
(4, 7, FALSE, TRUE, '2024-06-05'),
(5, 8, FALSE, TRUE, '2024-06-07'),
(6, 9, FALSE, TRUE, '2024-06-09'),
(2, 3, TRUE, FALSE, '2024-06-12'),
(3, 6, TRUE, FALSE, '2024-06-14'),
(4, 7, TRUE, FALSE, '2024-06-16'),
(5, 8, TRUE, FALSE, '2024-06-18'),
(6, 9, TRUE, FALSE, '2024-06-20');

-- Table for storing user wishlists
CREATE TABLE dbo.tbl_wishlists (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    added DATE,
    deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES dbo.tbl_user(user_id),
    FOREIGN KEY (book_id) REFERENCES dbo.tbl_book(book_id)
);

-- Insert data into tbl_wishlists
INSERT INTO dbo.tbl_wishlists (user_id, book_id, added) VALUES
(1, 1, '2024-06-01'),
(2, 1, '2024-06-02'),
(3, 1, '2024-06-03'),
(4, 1, '2024-06-24'),
(5, 1, '2024-06-01'),
(1, 1, '2024-06-06'),
(2, 1, '2024-06-04'),
(3, 1, '2024-06-08'),
(4, 1, '2024-06-09'),
(5, 1, '2024-06-10');

-- Table for storing book recommendations
CREATE TABLE dbo.tbl_recommendations (
    recommendations_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    recommendation_book_id INT,
    deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES dbo.tbl_user(user_id),
    FOREIGN KEY (book_id) REFERENCES dbo.tbl_book(book_id),
    FOREIGN KEY (recommendation_book_id) REFERENCES dbo.tbl_book(book_id)
);

-- Insert data into tbl_recommendations
INSERT INTO dbo.tbl_recommendations (user_id, book_id, recommendation_book_id) VALUES
(2, 6, 3),
(2, 2, 4),
(3, 3, 5),
(4, 4, 6),
(2, 5, 7),
(3, 6, 8),
(2, 7, 9),
(3, 8, 10),
(4, 9, 4),
(5, 10, 2);
