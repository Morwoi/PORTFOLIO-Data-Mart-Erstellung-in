-- Creates a new user who borrows a book and returns it

-- 1. Define variables for the new address
SET @street = 'Musterstraße 123';
SET @city = 'Musterstadt';
SET @postal_code = '12345';
SET @country = 'Germany';
SET @description = 'Test address';

-- Insert the new address into the database
INSERT INTO dbo.tbl_addresses (street, city, postal_code, country, description) 
VALUES (@street, @city, @postal_code, @country, @description);

-- Retrieve the new address_id
SET @new_address_id = LAST_INSERT_ID();

-- Output the Line of the newly created address
SELECT * from dbo.tbl_addresses where address_id = @new_address_id;

-- 2. Define variables for the new user
SET @first_name = 'Test';
SET @last_name = 'User';
SET @email = 'test.user@example.com';
SET @phone_number = '0123-4567890';
SET @birth_date = '1990-01-01';

-- Insert the new user into the database
INSERT INTO dbo.tbl_user (first_name, last_name, email, phone_number, address_id, birth_date) 
VALUES (@first_name, @last_name, @email, @phone_number, @new_address_id, @birth_date);

-- Retrieve the new user_id
SET @new_user_id = LAST_INSERT_ID();

-- 3. Borrow a book
SET @book_id_to_borrow = 10;
SET @borrow_date = CURDATE();

INSERT INTO dbo.tbl_borrowings (user_id, book_id, borrow_date, return_date) 
VALUES (@new_user_id, @book_id_to_borrow, @borrow_date, @return_date);

-- 4. Update the read status to TRUE and log the change

-- Update the read status to TRUE and set the new adress_id
UPDATE dbo.tbl_book 
SET read_status = TRUE, 
    address_id = @new_address_id
WHERE book_id = @book_id_to_borrow;

-- Log the change, assuming the previous status was FALSE
INSERT INTO dbo.tbl_read_status_log (user_id, book_id, previous_read_status, new_read_status, log_date) 
VALUES (@new_user_id, @book_id_to_borrow, FALSE, TRUE, CURDATE());

-- 5. Set the read status back to FALSE while the user keep the book 
UPDATE dbo.tbl_borrowings 
SET return_date = CURDATE() 
WHERE user_id = @new_user_id AND book_id = @book_id_to_borrow;

UPDATE dbo.tbl_book 
SET read_status = FALSE 
WHERE book_id = @book_id_to_borrow;

INSERT INTO dbo.tbl_read_status_log (user_id, book_id, previous_read_status, new_read_status, log_date) 
VALUES (@new_user_id, @book_id_to_borrow, TRUE, FALSE, CURDATE());

-- Output the Line of the newly created user
SELECT * from dbo.tbl_user a
left join dbo.tbl_addresses b on a.address_id  = b.address_id
 where user_id =  @new_user_id;

---------------------

-- Move a book from a residential address to a storage box
-- 1. Define variables for the book and addresses
SET @book_id = 10; 
SET @previous_address_id = 17; 
SET @new_address_id = 15;
SET @user_id = 12; 
SET @log_date = CURDATE();

-- 2. Update the address of the book in the tbl_book table
UPDATE dbo.tbl_book 
SET address_id = @new_address_id 
WHERE book_id = @book_id AND address_id = @previous_address_id;

-- 3. Insert the move into the tbl_position_log table
INSERT INTO dbo.tbl_position_log (user_id, book_id, log_date, previous_address_id, new_address_id) 
VALUES (@user_id, @book_id, @log_date, @previous_address_id, @new_address_id);

-- Output the Line of the newly created position log entry
SELECT * from dbo.tbl_position_log where position_log_id = LAST_INSERT_ID();

---------------------


-- Recommend a book
-- 1. Define variables for the recommendation
SET @user_id = 5;
SET @book_id = 9; 
SET @recommendation_book_id = 2; 

-- 2. Insert the recommendation into the tbl_recommendations table
INSERT INTO dbo.tbl_recommendations (user_id, book_id, recommendation_book_id, deleted) 
VALUES (@user_id, @book_id, @recommendation_book_id, FALSE);

--  Output the Line of the newly created recommendation
SELECT * from dbo.tbl_recommendations where recommendations_id = LAST_INSERT_ID();

---------------------


-- Rate a book
-- 1. Define variables for the rating
SET @user_id = 6; 
SET @book_id = 9;
SET @rating = 5; 
SET @comment = 'Great book! Highly recommended.'; 
SET @rating_date = CURDATE(); 

-- 2. Insert the rating into the tbl_ratings table
INSERT INTO dbo.tbl_ratings (user_id, book_id, rating, comment, rating_date, deleted) 
VALUES (@user_id, @book_id, @rating, @comment, @rating_date, FALSE);

-- Output the Line of the newly created rating
SELECT * from dbo.tbl_ratings where rating_id = LAST_INSERT_ID();

---------------------

-- Insert a new author into the database and add a new book
-- 1 Data vor the autor

SET @first_name = 'George';
SET @last_name = 'Orwell';
SET @origin = 'United Kingdom';
SET @language_id = 2; 

-- 2. Insert the autor into the tbl_authors table
INSERT INTO dbo.tbl_authors (first_name, last_name, origin, language_id, deleted) 
VALUES (@first_name, @last_name, @origin, @language_id, FALSE);

-- Retrieve the ID of the newly created author
SET @new_author_id = LAST_INSERT_ID();

-- Insert a book into the database
-- 1. Define variables for the book
SET @title = '1984';
SET @publication_year = 1949;
SET @isbn = '9780451524935';
SET @category_id = 9;
SET @language_id = 2; 
SET @owner_id = 4;
SET @address_id = 2;

-- 2. Insert the book into the tbl_book  with the new author
INSERT INTO dbo.tbl_book (title, publication_year, isbn, category_id, read_status, deleted, language_id, owner_id, author_id, address_id) 
VALUES (@title, @publication_year, @isbn, @category_id, FALSE, FALSE, @language_id, @owner_id, @new_author_id, @address_id);

--  Output the Line of the newly created book
SELECT * from dbo.tbl_book where book_id = LAST_INSERT_ID();


---------------------


-- Add a book to a user's wishlist
-- 1. Define variables for the wishlist entry
SET @user_id = 11; 
SET @book_id = 1; 
SET @added_date = CURDATE();

-- 2. Insert the wishlist entry into the tbl_wishlists table
INSERT INTO dbo.tbl_wishlists (user_id, book_id, added, deleted) 
VALUES (@user_id, @book_id, @added_date, FALSE);

-- Ou Output the Line of the newly created wishlist entry
SELECT * from dbo.tbl_wishlists where wishlist_id = LAST_INSERT_ID();

---------------------

-- Reserve a book for a user
-- 1. Define variables for the reservation
SET @user_id = 5; 
SET @book_id = 6; 
SET @reservation_date = CURDATE(); 
SET @status = 'offen'; 

-- 2. Insert the reservation into the tbl_reservations table
INSERT INTO dbo.tbl_reservations (user_id, book_id, reservation_date, status, deleted) 
VALUES (@user_id, @book_id, @reservation_date, @status, FALSE);

-- Output the Line of the newly created reservation
SELECT * from dbo.tbl_reservations where reservation_id = LAST_INSERT_ID();
