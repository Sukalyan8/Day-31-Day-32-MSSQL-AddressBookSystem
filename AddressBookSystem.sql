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

select *from Address_Book_Table;

--Uc-4 Edititng contact using name
Update Address_Book_Table
set Email='rasmitapati778@gmail.com'
where FirstName='Rasmita'

Update Address_Book_Table
set Address='Jajpur Road Dala By Pass'
where FirstName='Rakshi' and LastName='Mohapatra';

delete 
from Address_Book_Table
where FirstName='Rasmita' and LastName='Pati'

select *from Address_Book_Table;

select * from Address_Book_Table
where City='Jajpur' or State='Odisha'

---uc-7  Retrieve Count of Person belonging to a City or State----
Insert into Address_Book_Table(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('RasmitaPati','Runu','JajpurTown','Jajapur','Odisha',755007,8144125876,'Runu81@gmail.com')
select Count(*),state,City
from Address_Book_Table
Group by state,City

----uc-8 Ability to sort by person name bycity---
select *from Address_Book_Table
where City='JajpurRoad'
order by FirstName,LastName;

---uc-9 Adding Address Book With Name and Type-----
alter table Address_Book_Table
add AddressBookName varchar(100),
Type varchar(100)


--Update values for craeted book name and type column---
update Address_Book_Table
set AddressBookName='PrabhasFans',Type='Fan_group'
where FirstName='Rakshi' or FirstName='Rasmita'

--Update vaalues for craeted book name and type column---
update Address_Book_Table
set AddressBookName='Dash&Pati',Type='Family'
where FirstName='Papuni'

--Update vaalues for craeted book name and type column---
update Address_Book_Table
set AddressBookName='PriyadarshiniMohapatra',Type='Dears'
where FirstName='Rakshi'

select *from Address_Book_Table;

----uc-10 get get number of contact based on count by type-----
select Count(*) as NumberOfContacts,Type
from Address_Book_Table
Group by Type

select type,count(*)
from Address_Book_Table
group by type;


---uc-11 add Person Name both Family and Profession
Insert into Address_Book_Table(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('Sukalyan','Dash','Salapada By Pass','Anandapur','Odisha',758020,8917361920,'sukalyandash1920@gmail.com'),
('Rasmita','Pati','Mugpal','Jajpur','Odisha',755009,7788987513,'rasmitapati966@gmail.com');

update Address_Book_Table
set AddressBookName='Wife',Type='Family'
where FirstName='Rasmita'

update Address_Book_Table
set AddressBookName='MD',Type='Profession'
where FirstName='Sukalyan'

----adding Family---
select * from Address_Book_Table;
insert into Address_Book_Table
values ('Kalyani','Panda','salapada','Anandapur','Kolkata',758020,8249963350,'kalyanipanda82@gmail.com','Mom','Family');
--Addding to Profession
select * from Address_Book_Table;
insert into Address_Book_Table
values ('Subash','Dash','Hatichappal','Sudusudia','Bangalore',758021,8480647578,'subashchandra84@gmail','MD','Profession');

--uc-12-Creating different entities 
--creating table typeofcontacts
create table TypesOfContacts
(
typeid int primary key ,
typename varchar(50) not null);
--inserting data into type of contacts
insert into Typesofcontacts
values
(1,'Family'),
(2,'Friends'),
(3,'Business');
alter table Address_BooK_Table
add contactid int primary key identity(1,1);

select *from Address_Book_Table;

create table AddressBookNames
(addressBookId int primary key identity(1,1),
addressBookName varchar(50) not null );
---inserting values to addressbook table--
insert into AddressBooknames values ('S'),('P'),('H');
select * from AddressBookNames;

---Creating table address book names mapper which will contain contact id and address book names id---
create table addressbookMapping
(contactid int not null, addressbookid int not null);
--inserting data into address book mapper id
insert into addressbookMapping
values
(1,1),(2,1),(3,2);

select * from Address_Book_Table;
select a.firstname,a.phoneNumber,a.city,a.state,a.eMail,b.addressbookname,b.addressBookId
from Address_Book_Table a
join addressbookMappeing d
on a.contactid= d.contactId
join AddressBookNames b
on b.addressBookId= d.addressbookId


-- UC-13 Retrieving data using new table structure 
--UC6
select FirstName,LastName,city from Address_Book_Table
where FirstName='Papuni';

--UC7
select city,count(*) from Address_Book_Table
where city='Anandapur'
group by city;

--UC8
select * from  Address_Book_Table
where city='Salapada'
order by FirstName,LastName;

--UC10
select * from Address_Book_Table;

select typename,count(*) numberOfContactPersons from Address_Book_Table a
join addressbookMappeing am
on am.contactid= a.contactid
join TypesOfContacts t
on t.typeid= am.addressbookid
group by t.typename;
