--Sign Up--
CREATE OR REPLACE FUNCTION Add_User (_username varchar(100) = NULL, _password VARCHAR (100) = NULL, _user_type VARCHAR (100) = NULL, _salt VARCHAR(255)=NULL)
RETURNS VOID
AS
$BODY$
BEGIN
INSERT INTO Users(
  username,
  password,
  user_type,
  salt
)values(
  _username,
  _password,
  _user_type,
  _salt
);
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--LOGIN--
CREATE OR REPLACE FUNCTION Login_User(_username varchar(100)=NULL, _password varchar(100)=NULL)
RETURNS refcursor AS
$BODY$
DECLARE
ref refcursor;
BEGIN
OPEN ref FOR
SELECT username, user_type FROM Users
WHERE username = _username
AND password = _password;
RETURN ref;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--GET USER--
CREATE OR REPLACE FUNCTION Salt(_username varchar(100) = NULL)
RETURNS refcursor AS
$BODY$
DECLARE
ref refcursor;
BEGIN
OPEN ref FOR SELECT salt FROM Users WHERE username = _username;
RETURN ref;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
--ADD Restaurant--
CREATE OR REPLACE FUNCTION Add_Restaurant (_username VARCHAR = NULL, _name varchar(100) = NULL, _hotline VARCHAR (100) = NULL, _delivery_time VARCHAR (100) = NULL, _delivery_fees INT = NULL, _delivery_hours VARCHAR(200) = NULL, _description text = NULL)
RETURNS VOID
AS
$BODY$
BEGIN
INSERT INTO Restaurants(
  username,
  name,
  hotline,
  delivery_time,
  delivery_fees,
  delivery_hours,
  description
)values(
  _username,
  _name,
  _hotline,
  _delivery_time,
  _delivery_fees,
  _delivery_hours,
  _description
);
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--GET Restaurant By ID--
CREATE OR REPLACE FUNCTION Get_Restaurant_By_Id (_id INT = NULL)
RETURNS refcursor AS
$BODY$
DECLARE
ref refcursor;
BEGIN
OPEN ref FOR SELECT * FROM Restaurants WHERE id = _id;
RETURN ref;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--GET Restaurant By Username--
CREATE OR REPLACE FUNCTION Get_Restaurant_By_Username (_username VARCHAR = NULL)
RETURNS refcursor AS
$BODY$
DECLARE
ref refcursor;
BEGIN
OPEN ref FOR SELECT * FROM Restaurants WHERE username = _username;
RETURN ref;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--UPDATE Restaurant By ID--
CREATE OR REPLACE FUNCTION Update_Restaurant_By_Id (_id INT = NULL, _name varchar(100) = NULL, _hotline VARCHAR (100) = NULL, _delivery_time VARCHAR (100) = NULL, _delivery_fees INT = NULL, _delivery_hours VARCHAR(200) = NULL, _description text = NULL)
RETURNS integer AS
$BODY$
DECLARE
  a_count integer;
BEGIN
UPDATE Restaurants
SET name = _name, hotline = _hotline, delivery_time = _delivery_time, delivery_fees = _delivery_fees, delivery_hours = _delivery_hours, description = _description
WHERE id = _id;
GET DIAGNOSTICS a_count = ROW_COUNT;
RETURN a_count;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--UPDATE Restaurant By Username--
CREATE OR REPLACE FUNCTION Update_Restaurant_By_Username (_username VARCHAR = NULL, _name varchar(100) = NULL, _hotline VARCHAR (100) = NULL, _delivery_time VARCHAR (100) = NULL, _delivery_fees INT = NULL, _delivery_hours VARCHAR(200) = NULL, _description text = NULL)
RETURNS integer AS
$BODY$
DECLARE
  a_count integer;
BEGIN
UPDATE Restaurants
SET name = _name, hotline = _hotline, delivery_time = _delivery_time, delivery_fees = _delivery_fees, delivery_hours = _delivery_hours, description = _description
WHERE username = _username;
GET DIAGNOSTICS a_count = ROW_COUNT;
RETURN a_count;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--DELETE Restaurant--
CREATE OR REPLACE FUNCTION Delete_Restaurant (_id INT = NULL)
RETURNS integer AS
$BODY$
DECLARE
  a_count integer;
BEGIN
DELETE FROM Restaurants
WHERE id = _id;
GET DIAGNOSTICS a_count = ROW_COUNT;
RETURN a_count;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--ADD Restaurant--
CREATE OR REPLACE FUNCTION Add_Profile (_id INT = NULL, _name VARCHAR (100) = NULL, _birthdate VARCHAR(100) = NULL, _bio VARCHAR(300) = NULL, _phone_number VARCHAR(200) = NULL, _address VARCHAR(200) = NULL)
RETURNS VOID
AS
$BODY$
BEGIN
INSERT INTO Profiles(
  name,
	birthdate  ,
	bio ,
	phone_number ,
	address 
)values(
  _name,
	_birthdate  ,
	_bio ,
	_phone_number ,
	_address 
);
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--GET Restaurant--
CREATE OR REPLACE FUNCTION Get_Profile_By_Id (_id INT = NULL)
RETURNS refcursor AS
$BODY$
DECLARE
ref refcursor;
BEGIN
OPEN ref FOR SELECT * FROM Profiles WHERE id = _id;
RETURN ref;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--UPDATE Restaurant--
CREATE OR REPLACE FUNCTION Update_Profile_By_Id (_id INT = NULL, _name VARCHAR (100) = NULL, _birthdate VARCHAR(100) = NULL, _bio VARCHAR(300) = NULL, _phone_number VARCHAR(200) = NULL, _address VARCHAR(200) = NULL)
RETURNS integer AS
$BODY$
DECLARE
  a_count integer;
BEGIN
UPDATE Profiles
SET name = _name, birthdate = _birthdate, bio = _bio, phone_number = _phone_number, address = _address
WHERE id = _id;
GET DIAGNOSTICS a_count = ROW_COUNT;
RETURN a_count;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--DELETE Restaurant--
CREATE OR REPLACE FUNCTION Delete_Profile (_id INT = NULL)
RETURNS integer AS
$BODY$
DECLARE
  a_count integer;
BEGIN
DELETE FROM Profiles
WHERE id = _id;
GET DIAGNOSTICS a_count = ROW_COUNT;
RETURN a_count;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
