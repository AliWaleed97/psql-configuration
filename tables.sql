CREATE TABLE Users
(
username  VARCHAR (100) PRIMARY KEY  UNIQUE NOT NULL,
password  VARCHAR (100) NOT NULL,
user_type VARCHAR (100) NOT NULL,
salt      VARCHAR(255) NOT NULL
);

CREATE TABLE Restaurants
(
id BIGSERIAL PRIMARY KEY NOT NULL,
username VARCHAR REFERENCES Users (username) ON DELETE CASCADE,
name VARCHAR (100) NOT NULL UNIQUE,
hotline VARCHAR (100),
delivery_time VARCHAR (100),
delivery_fees INT,
delivery_hours VARCHAR(200),
description text
);

CREATE TABLE Restaurants_Images
(
id BIGSERIAL REFERENCES Restaurants (id) ON DELETE CASCADE,
image VARCHAR (100),
type VARCHAR (100)
);

CREATE TABLE Profiles
(
id BIGSERIAL PRIMARY KEY NOT NULL,
-- username VARCHAR REFERENCES Users (username) ON DELETE CASCADE,
name VARCHAR (100) NOT NULL UNIQUE,
birthdate VARCHAR(100) ,
bio VARCHAR(300),
phone_number VARCHAR(200),
address VARCHAR(200)
);