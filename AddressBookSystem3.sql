--uc-1 Creating database
create database AddressBookServices;

--uc-2 Creating table
create table Address_Book_Table
(FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200)
)

--UC-3 Inserting values to the table
Insert into Address_Book_Table(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('Sukalyan','Dash','Salapada By Pass','Anandapur','Odisha',758020,8917361920,'sukalyandash1920@gmail.com'),
('Rasmita','Pati','Mugpal','Jajpur','Odisha',755009,7788987513,'rasmitapati966@gmail.com'),
('Rakshi','Mohapatra','JajpurRoad','Jajpur','Odisha',755008,9348291792,'rakshi93@gmail.com');