DROP DATABASE IF EXISTS revou_review;
CREATE DATABASE product_review;
USE product_review;

CREATE TABLE product (
	id INTEGER PRIMARY KEY auto_increment,
    name VARCHAR(100) NOT NULL,
    price INTEGER NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_review (
	id INTEGER PRIMARY KEY auto_increment,
    product_id INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL,
    rating INTEGER NOT NULL,
    review_content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user (
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(191) NOT NULL,
    name VARCHAR(191) NOT NULL,
    password VARCHAR(191) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO product_review (product_id, email, rating, review_content) VALUES (1,'test@gmail.com', 4, 'Good');

select * from product;
select * from product_review;
SELECT * FROM user;

DELETE FROM product WHERE id = 1;