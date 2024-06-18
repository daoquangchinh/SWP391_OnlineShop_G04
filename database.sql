
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
    id INT PRIMARY KEY ,
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

SET IDENTITY_INSERT roles ON;
INSERT INTO roles (id, roles_name) VALUES (1, 'Admin'), (2, 'User');
SET IDENTITY_INSERT roles OFF;

SET IDENTITY_INSERT users ON;
INSERT INTO users (id, username, password, fullname, gender, phone, email, img, role_id, status) VALUES
(1, 'admin', 'admin123', 'Admin User', 'Male', '0123456789', 'admin@example.com', 'admin.jpg', 1, 1),
(2, 'user1', 'user123', 'User One', 'Female', '0987654321', 'user1@example.com', 'user1.jpg', 2, 1);
SET IDENTITY_INSERT users OFF;

SET IDENTITY_INSERT Brand ON;
INSERT INTO Brand (id, Brand_name) VALUES (1, 'Nike Sportswear'), (2, 'Jordan'), (3, 'Nike By You'), (4, 'NikeLab'), (5, 'ACG');
SET IDENTITY_INSERT Brand OFF;

SET IDENTITY_INSERT Sports ON;
INSERT INTO Sports (id, Sports_name) VALUES (1, 'Lifestyles'), (2, 'Running'), (3, 'Tennis'), (4, 'Running'), (5, 'Basketball'), (6, 'Golf');
SET IDENTITY_INSERT Sports OFF;

SET IDENTITY_INSERT Gender ON;
INSERT INTO Gender (id, gender_name) VALUES (1, 'Male'), (2, 'Female');
SET IDENTITY_INSERT Gender OFF;

INSERT INTO Shoe_size (size) VALUES (37), (38), (39), (40), (41), (42), (43), (44), (45);

INSERT INTO shoe_color (color)
VALUES ('Red'), ('Blue'), ('Black'), ('Purple'), ('Brown'), ('Pink'),('White'), ('Yellow'), ('Gray');

GO

INSERT INTO [dbo].[shoe]    ([id],[shoe_name],[brand_id],[sports_id],[gender_id],[description],[price],[discount],[img],[created_at],[updated_at])
     VALUES
           (1,'Nike Air Force 107',1,1,1,'The radiance lives on in the Nike Air Force 107, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.
Style: CW2288-111',2929000,0,'/img/img_Shoe/s1.jpg', '2024-06-17', '2024-06-14')
GO
GO

INSERT INTO [dbo].[product]
           ([shoe_id],[shoe_size_id],[shoe_color_id],[quantity])
     VALUES
           (1,4,7,5),
           (1,7,7,7),
           (1,9,7,8),
           (1,5,7,9),
           (1,4,3,6),
           (1,9,3,10),
           (1,4,3,4),
           (1,2,3,5),
           (1,3,3,2)
GO

GO

INSERT INTO [dbo].[img]
           ([img],[shoe_id],[shoe_color_id])
     VALUES
           ('/img/img_Shoe/s1.jpg',1,7),
           ('/img/img_Shoe/s1,1.jpg',1,7),
           ('/img/img_Shoe/s1,2.jpg',1,7),
           ('/img/img_Shoe/s1,3.jpg',1,7),
           ('/img/img_Shoe/s1,4.jpg',1,7),
('/img/img_Shoe/s1,5.jpg',1,3),
           ('/img/img_Shoe/s1,6.jpg',1,3),
           ('/img/img_Shoe/s1,7.jpg',1,3),
           ('/img/img_Shoe/s1,8.jpg',1,3),
           ('/img/img_Shoe/s1,9.jpg',1,3)



GO


GO

INSERT INTO [dbo].[shoe]    ([id],[shoe_name],[brand_id],[sports_id],[gender_id],[description],[price],[discount],[img],[created_at],[updated_at])
     VALUES
           (2,'Nike Killshot 2 Leather',1,1,1,'Inspired by the original low-profile tennis shoes, the Nike Killshot 2 updates the upper with premium textured leathers to create a fresh take on an old-school look. And it wouldnt be a "tennis" shoe without the gum-rubber soles reliable traction. From soft suedes to smooth leathers with the perfect sheen, its classic courtside attitude with a modern touch.
Colour Shown: Light Bone/Gum Yellow/Light British Tan/Sail
Style: HF5699-019',3239000,0,'/img/img_Shoe/s3.jpg', '2024-06-17', '2024-06-14')
GO
GO

INSERT INTO [dbo].[product]
           ([shoe_id],[shoe_size_id],[shoe_color_id],[quantity])
     VALUES
           (2,4,9,5),
           (2,7,9,7),
           (2,9,9,8),
           (2,5,9,9),
(2,8,9,3)
GO

GO

INSERT INTO [dbo].[img]
           ([img],[shoe_id],[shoe_color_id])
     VALUES
           ('/img/img_Shoe/s3.jpg',2,9),
           ('/img/img_Shoe/s3,1.jpg',2,9),
           ('/img/img_Shoe/s3,2.jpg',2,9),
           ('/img/img_Shoe/s3,3.jpg',2,9),
           ('/img/img_Shoe/s3,4.jpg',2,9)

GO



GO

INSERT INTO [dbo].[shoe]    ([id],[shoe_name],[brand_id],[sports_id],[gender_id],[description],[price],[discount],[img],[created_at],[updated_at])
     VALUES
           (3,'Nike Cortez Textile',1,1,1,'You spoke. We listened. Based on your feedback, we have revamped the original Cortez while still keeping the retro appeal you know and love. This nylon and suede edition features a wider toe area and firmer side panels, so you can comfortably wear them day in, day out without any warping. Cortez fans—this ones for you.

Colour Shown: Black/White
Style: HF0263-001',2640000,0,'/img/img_Shoe/s4.jpg', '2024-06-17', '2024-06-14')
GO
GO

INSERT INTO [dbo].[product]
           ([shoe_id],[shoe_size_id],[shoe_color_id],[quantity])
     VALUES
           (3,4,3,5),
           (3,6,3,7),
           (3,7,3,8),
           (3,5,3,9),
(3,8,3,3),
(3,4,2,5),
           (3,6,2,7),
           (3,7,2,8),
           (3,5,2,9),
(3,8,2,3)

GO

GO

INSERT INTO [dbo].[img]
           ([img],[shoe_id],[shoe_color_id])
     VALUES
           ('/img/img_Shoe/s4.jpg',3,3),
           ('/img/img_Shoe/s4,1.jpg',3,3),
           ('/img/img_Shoe/s4,2.jpg',3,3),
           ('/img/img_Shoe/s4,3.jpg',3,2),
           ('/img/img_Shoe/s4,4.jpg',3,3),
('/img/img_Shoe/s4,5.jpg',3,2),
           ('/img/img_Shoe/s4,6.jpg',3,2),
           ('/img/img_Shoe/s4,7.jpg',3,2),
           ('/img/img_Shoe/s4,8.jpg',3,2),
           ('/img/img_Shoe/s4,9.jpg',3,2)


GO



GO

INSERT INTO [dbo].[shoe]    ([id],[shoe_name],[brand_id],[sports_id],[gender_id],[description],[price],[discount],[img],[created_at],[updated_at])
     VALUES
           (4,'Nike Motiva',Null,2,1,'The Nike Motiva helps you step through whatever the day brings, at your pace. Its uniquely patterned outsole and exaggerated rocker combine to give you a super-smooth, cushioned and comfortable ride. This means you can walk, jog or run comfortably and come back for your next leisurely stroll confidently. It gives you optimal support for your every move, every day.
Colour Shown: Black/Anthracite/White/Black
Style: DV1237-001',3239000,0,'/img/img_Shoe/s2.jpg', '2024-06-17', '2024-06-14')
GO
GO

INSERT INTO [dbo].[product]
           ([shoe_id],[shoe_size_id],[shoe_color_id],[quantity])
     VALUES
           (4,4,3,5),
           (4,6,3,7),
           (4,7,3,8),
           (4,5,3,9),
           (4,8,3,3),
           (4,4,9,5),
           (4,6,9,7),
           (4,7,9,8),
           (4,5,9,9),
(4,8,9,3),
(4,4,7,5),
           (4,6,7,5),
           (4,7,7,5),
           (4,5,7,4),
(4,8,7,3)


GO

GO

INSERT INTO [dbo].[img]
           ([img],[shoe_id],[shoe_color_id])
     VALUES
           ('/img/img_Shoe/s2.jpg',4,3),
           ('/img/img_Shoe/s2,1.jpg',4,3),
           ('/img/img_Shoe/s2,2.jpg',4,3),
           ('/img/img_Shoe/s2,3.jpg',4,3),
           ('/img/img_Shoe/s2,4.jpg',4,3),
('/img/img_Shoe/s2,5.jpg',4,9),
           ('/img/img_Shoe/s2,6.jpg',4,9),
           ('/img/img_Shoe/s2,7.jpg',4,9),
           ('/img/img_Shoe/s2,8.jpg',4,9),
           ('/img/img_Shoe/s2,9.jpg',4,9),
('/img/img_Shoe/s2,10.jpg',4,7),
           ('/img/img_Shoe/s2,11.jpg',4,7),
           ('/img/img_Shoe/s2,12.jpg',4,7),
           ('/img/img_Shoe/s2,13.jpg',4,7),
           ('/img/img_Shoe/s2,14.jpg',4,7)



GO

INSERT INTO [dbo].[shoe]    ([id],[shoe_name],[brand_id],[sports_id],[gender_id],[description],[price],[discount],[img],[created_at],[updated_at])
     VALUES
           (5,'Tatum 2 Sidewalk Chalk PF',5,2,1,'Pastels swirl, bringing to mind the hype of a new game. And the Tatum 2 has court-ready tech to help you with energy return through the 4th and beyond. So get out there, have some fun—and get that W.

Colour Shown: Light Soft Pink/Smoke/Lilac/Mint Foam
Style: FZ2203-600',3669000,0,'/img/img_Shoe/s5.jpg', '2024-06-17', '2024-06-14')
GO

GO
INSERT INTO [dbo].[product]
           ([shoe_id],[shoe_size_id],[shoe_color_id],[quantity])
     VALUES
           (5,4,6,5),
           (5,7,6,7),
           (5,9,6,8),
           (5,5,6,9),
(5,8,6,3)
GO

GO

INSERT INTO [dbo].[img]
           ([img],[shoe_id],[shoe_color_id])
     VALUES
           ('/img/img_Shoe/s5.jpg',5,6),
           ('/img/img_Shoe/s5,1.jpg',5,6),
           ('/img/img_Shoe/s5,2.jpg',5,6),
           ('/img/img_Shoe/s5,3.jpg',5,6),
           ('/img/img_Shoe/s5,4.jpg',5,6)

GO
GO
INSERT INTO [dbo].[shoe]    ([id],[shoe_name],[brand_id],[sports_id],[gender_id],[description],[price],[discount],[img],[created_at],[updated_at])
     VALUES
           (6,'Nike Air Force 107 EasyOn',1,1,2,'Quicker than 1, 2, 3—the original hoops shoe lets you get going. This version of the AF-1 features Nike EasyOn technology for a hands-free experience. The flexible heel collapses when you step in then snaps back into place, making it easy to slip the shoe on and off. Add that to its clean, crisp leather and youve got ultimate wearability. Yeah, its everything you love and then some.
Colour Shown: White/White/White Style: DX5883-100',3239000,0,'/img/img_Shoe/s6.jpg', '2024-06-17', '2024-06-14'),
(7,'Nike Pegasus 41',4,1,2,'Responsive cushioning in the Pegasus provides an energised ride for everyday road running. Experience lighter-weight energy return with dual Air Zoom units and a ReactX foam midsole. Plus, improved engineered mesh on the upper decreases weight and increases breathability.
Colour Shown: Volt/Barely Volt/Black
Style: FD2723-701',3829000,0,'/img/img_Shoe/s7.jpg', '2024-06-17', '2024-06-14'),
(8,'Nike Mercurial Vapor 15 Academy',4,1,2,'The pitch is yours when you lace up in the Vapor 15 Academy MG. Its loaded with a Zoom Air unit and flexible NikeSkin at the top for exceptional touch, so you can dominate in the waning minutes of a match—when it matters most. Fast is in the Air.

Colour Shown: Pink Foam/Black
Style: DJ5631-601',2479000,0,'/img/img_Shoe/s8.jpg', '2024-06-17', '2024-06-14'),
(9,'Nike Phantom GX 2 Academy',4,1,2,'Looking to take your game to the next level? The Phantom GX 2 Academy helps put you in prime position of the goal, whether youre the playmaker, assister or finisher. The rest is up to you. Created with goals in mind, NikeSkin covers the striking area of the boot, while Nike Cyclone 360 traction helps guide your unscripted agility.

Colour Shown: Sunset Pulse/Black
Style: FD6723-600',2479000,0,'/img/img_Shoe/s9.jpg', '2024-06-17', '2024-06-14'),
(10,'Nike Phantom Luna 2 Academy',4,1,2,'Looking to take your game to the next level? The Phantom Luna 2 Academy helps put you in prime position in front of the net, whether youre the organiser, assister or finisher. The rest is up to you. Created with goals in mind, NikeSkin covers the striking area of the boot, while Nike Cyclone 360 traction helps guide your unscripted agility.
Colour Shown: Sunset Pulse/Black
Style: FD6725-600',2779000,0,'/img/img_Shoe/s10.jpg', '2024-06-17', '2024-06-14')


GO
GO
 
INSERT INTO [dbo].[product]
           ([shoe_id],[shoe_size_id],[shoe_color_id],[quantity])
     VALUES
           
           (6,1,7,7),(6,2,7,7),(6,3,7,7),(6,4,7,7),
           (7,1,7,8),(7,2,7,8),(7,3,7,8),(7,4,7,8),(7,5,7,8),
           (8,1,6,9),(8,2,6,9),(8,3,6,9),(8,4,6,9),(8,5,6,9), 
           (9,4,6,6),(9,1,6,6),(9,3,6,6),
           (10,1,6,10),(10,6,6,10)
          
GO
 
GO
 
INSERT INTO [dbo].[img]
           ([img],[shoe_id],[shoe_color_id])
     VALUES
           ('/img/img_Shoe/s6.jpg',6,7),
           ('/img/img_Shoe/s6,1.jpg',6,7),
           ('/img/img_Shoe/s6,2.jpg',6,7),
           ('/img/img_Shoe/s6,3.jpg',6,7),
           ('/img/img_Shoe/s6,4.jpg',6,7),
           ('/img/img_Shoe/s7.jpg',7,6),
		   ('/img/img_Shoe/s7,1.jpg',7,6),
		   ('/img/img_Shoe/s7,2.jpg',7,6),
		   ('/img/img_Shoe/s7,3.jpg',7,6),
		   ('/img/img_Shoe/s7,4.jpg',7,6),
           ('/img/img_Shoe/s8.jpg',8,5),
		   ('/img/img_Shoe/s8,1.jpg',8,5),
		   ('/img/img_Shoe/s8,2.jpg',8,5),
		   ('/img/img_Shoe/s8,3.jpg',8,5),
		   ('/img/img_Shoe/s8,4.jpg',8,5),
           ('/img/img_Shoe/s9.jpg',9,6),
		   ('/img/img_Shoe/s9,1.jpg',9,6),
		   ('/img/img_Shoe/s9,2.jpg',9,6),
		   ('/img/img_Shoe/s9,3.jpg',9,6),
		   ('/img/img_Shoe/s9,4.jpg',9,6),
		   ('/img/img_Shoe/s10.jpg',10,6),
		   ('/img/img_Shoe/s10,1.jpg',10,6),
		   ('/img/img_Shoe/s10,2.jpg',10,6),
		   ('/img/img_Shoe/s10,3.jpg',10,6),
		   ('/img/img_Shoe/s10,4.jpg',10,6)
           


