CREATE TABLE roles (
    id INT PRIMARY KEY IDENTITY(1,1),
    roles_name VARCHAR(1000)
);
CREATE TABLE users (
    id INTEGER PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100) NOT NULL,
    [password] VARCHAR(100) NOT NULL,
    fullname VARCHAR(100) ,
    gender VARCHAR(10),
    phone VARCHAR(11),
    email VARCHAR(100),
    img VARCHAR(1000),
    role_id INT NOT NULL,
    Status int Not Null,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);





CREATE TABLE Brand (
    id INT PRIMARY KEY IDENTITY(1,1),
    Brand_name VARCHAR(1000)
);

CREATE TABLE Sports (
    id INT PRIMARY KEY IDENTITY(1,1),
    Sports_name VARCHAR(1000)
);

CREATE TABLE Gender (
    id INT PRIMARY KEY IDENTITY(1,1),
    gender_name VARCHAR(1000)
);


CREATE TABLE shoe (
    id INT PRIMARY KEY IDENTITY(1,1),
    shoe_name VARCHAR (1000) NOT NULL,
    brand_id INT,
    sports_id INT,
    gender_id INT,
    [description] VARCHAR(1000),
    price Money NOT NULL,
    discount Money NOT NULL,
    img VARCHAR (1000) NOT NULL,
    created_at DATE,
    updated_at DATE,
    FOREIGN KEY (Brand_id) REFERENCES Brand(id),
    FOREIGN KEY (Sports_id) REFERENCES Sports(id),
    FOREIGN KEY (Gender_id) REFERENCES gender(id)
);


CREATE TABLE shoe_size (
    id INT PRIMARY KEY IDENTITY(1,1),
    size INT NOT NULL
);
CREATE TABLE shoe_color (
    id INT PRIMARY KEY IDENTITY(1,1),
    color varchar(100) NOT NULL,
);
  
create table img (
    id INT PRIMARY KEY IDENTITY(1,1),
  img varchar(1000),
  shoe_id INT NOT NULL,
 shoe_color_id INT NOT NULL,
 FOREIGN KEY (shoe_color_id ) REFERENCES shoe_color(id),
    FOREIGN KEY (shoe_id) REFERENCES shoe(id),


);
 
  CREATE TABLE product (
    id INT PRIMARY KEY IDENTITY(1,1),
    shoe_id INT NOT NULL,
    shoe_size_id INT NOT NULL,
    shoe_color_id INT NOT NULL,
    quantity INT NOT NULL,
 FOREIGN KEY (shoe_size_id) REFERENCES shoe_size(id),
 FOREIGN KEY (shoe_color_id ) REFERENCES shoe_color(id),
    FOREIGN KEY (shoe_id) REFERENCES shoe(id),

);



CREATE TABLE FeedBack (
    id INT PRIMARY KEY IDENTITY(1,1),
    [user_id] INT,
    shoe_id INT,
    date_node DATE,
    [text] VARCHAR(1000),
    FOREIGN KEY ([user_id]) REFERENCES users(id),
    FOREIGN KEY (shoe_id) REFERENCES shoe(id)
);





CREATE TABLE orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    [user_id] INT,
    order_date DATE,
    FOREIGN KEY ([user_id]) REFERENCES users(id)
);


CREATE TABLE OrderDetails (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    shoe_id INT,
	product_id INT,
	price MONEY,
	quantity int  not null,
	total_money MONEY not null,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);




CREATE TABLE preferential (
    id INT PRIMARY KEY
);


CREATE TABLE cart_item (
    id INT PRIMARY KEY IDENTITY(1,1),
	[user_id] INT not null,
	product_id INT Not null ,
    quantity INT Not null,
	total money ,
	FOREIGN KEY ([user_id]) REFERENCES users(id),
	FOREIGN KEY (product_id) REFERENCES product(id)
);

go 

INSERT INTO roles (roles_name)
VALUES ('Admin'), ('User'), ('Guest');
go 
INSERT INTO users (username, [password], fullname, gender, phone, email, img, role_id, Status)
VALUES ('john_doe', 'password123', 'John Doe', 'Male', '1234567890', 'john.doe@example.com', 'john.jpg', 1, 1),
       ('jane_smith', 'password456', 'Jane Smith', 'Female', '0987654321', 'jane.smith@example.com', 'jane.jpg', 2, 1);
go 
INSERT INTO Brand (Brand_name)
VALUES ('Nike'), ('Adidas'), ('Puma');
go 
INSERT INTO Sports (Sports_name)
VALUES ('Running'), ('Basketball'), ('Football');
go INSERT INTO Gender (gender_name)
VALUES ('Male'), ('Female');
go INSERT INTO shoe (shoe_name, brand_id, sports_id, gender_id, [description], price, discount, img, created_at, updated_at)
VALUES ('Nike Air Max', 1, 1, 1, 'Running shoes with air cushioning', 120.00, 10.00, 'nike_air_max.jpg', '2024-06-14', '2024-06-14'),
       ('Adidas Superstar', 2, 2, 2, 'Classic basketball shoes', 100.00, 0.00, 'adidas_superstar.jpg', '2024-06-14', '2024-06-14');
go 
INSERT INTO shoe_size (size)
VALUES (35),(36),(37),(38), (39), (40), (41),(42),(43),(44),(45);
go 
INSERT INTO shoe_color (color)
VALUES ('Red'), ('Blue'), ('Black'), ('Purple'), ('Brown'), ('Pink'),('White'), ('Yellow'), ('Gray');
go 
INSERT INTO product (shoe_id, shoe_size_id, shoe_color_id, quantity)
VALUES
  (1, 1, 1, 6),
  (1, 2, 1, 7),
  (1, 3, 1, 8),
  (1, 1, 2, 9),
  (1, 1, 3, 10),
  (2, 1, 2, 8),
  (2, 2, 2, 8);
go 
INSERT INTO FeedBack (user_id, shoe_id, date_node, [text])
VALUES
  (1, 1, '2024-06-14', 'Great shoes!'),
  (2, 2, '2024-06-14', 'Comfortable and stylish.');
go 
INSERT INTO orders (user_id, order_date)
VALUES
  (1, '2024-06-14'),
  (2, '2024-06-14');
go 
INSERT INTO OrderDetails (order_id, shoe_id, price, product_id, total_money,quantity)
VALUES
  (1, 1, 120.000, 1, 1200.000,10),
  (2, 2, 100.000, 2, 900.000,10);
go 
INSERT INTO preferential (id)
VALUES (1);
go 
INSERT INTO cart_item ([user_id], product_id, quantity,total)
VALUES
  (1,1, 1, 2000.00),
  (2, 2,2, 2000.00);
go 
INSERT INTO img (img, shoe_id, shoe_color_id)
VALUES
    ('image1.jpg', 1, 1),
    ('image2.jpg', 1, 2);




