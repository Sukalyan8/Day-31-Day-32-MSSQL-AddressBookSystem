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