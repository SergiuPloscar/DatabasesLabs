--CREATE TABLE Fishes ( Fid INT PRIMARY KEY IDENTITY, FName Varchar (20) NOT NULL , Species Varchar (20) NOT NULL, Pid int foreign key references PolarBears(Pid))
--CREATE TABLE GlacialArea ( Gid INT PRIMARY KEY IDENTITY, GName Varchar(20) NOT NULL, Surface DECIMAL NOT NULL )
--CREATE TABLE PolarBears ( Pid INT PRIMARY KEY IDENTITY, PName Varchar (20) NOT NULL, Weight DECIMAL NOT NULL, Age int NOT NULL, Gid int FOREIGN KEY REFERENCES GlacialArea(Gid) )
--CREATE TABLE Seals ( Sid INT PRIMARY KEY IDENTITY, SName Varchar (20) NOT NULL, Weight DECIMAL NOT NULL, Age int NOT NULL )
--CREATE TABLE Interactions ( Pid int foreign key references PolarBears(Pid), Sid int foreign key references Seals(Sid), Date Date not null,Time Time not null, Communication bit  )

--INSERT INTO GlacialArea Values ('NorthPole',10.4)
--INSERT INTO GlacialArea Values ('SouthPole',20.54)
--INSERT INTO GlacialArea Values ('Antarctica',50.2)

--INSERT INTO PolarBears Values('Tom',12.2,10,1)
--INSERT INTO PolarBears Values('Ron',12.4,10,1)
--INSERT INTO PolarBears Values('Jon',11.5,10,2)
--INSERT INTO PolarBears Values('Fram',17.0,10,2)
--INSERT INTO PolarBears Values('Tan',13.4,10,3)

--Insert into Fishes Values ('Fish1','BigFish',1)
--Insert into Fishes Values ('Fish2','BigFish',1)
--Insert into Fishes Values ('Fish3','BigFish',2)
--Insert into Fishes Values ('Fish4','SmallFish',3)
--Insert into Fishes Values ('Fish5','SmallFish',4)
--Insert into Fishes Values ('Fish6','SmallFish',4)

--INSERT INTO Seals Values('Seal1',12.2,10)
--INSERT INTO  Seals Values('Seal2',12.4,2)
--INSERT INTO  Seals Values('Seal3',11.5,7)
--INSERT INTO  Seals Values('Seal4',17.0,10)
--INSERT INTO  Seals Values('Seal5',13.4,4)

--INSERT INTO Interactions Values (1,1,'2019-01-01', '07:00:00.123',1)
--INSERT INTO Interactions Values (1,2,'2019-01-01', '07:00:00',0)
--INSERT INTO Interactions Values (1,3,'2019-01-01', '08:00:00',1)
--INSERT INTO Interactions Values (2,1,'2019-01-01', '07:00:00',1)
--INSERT INTO Interactions Values (2,4,'2019-01-01', '09:00:00',0)
--INSERT INTO Interactions Values (3,3,'2019-01-01', '10:00:00',1)

GO

create procedure addInteraction @p int, @s int, @d date, @t time
as 
begin 
	insert into Interactions Values (@p,@s,@d,@t,NULL)
end 
go

Select * From Interactions
go

exec addInteraction 4,4,'2019-01-02','07:12'


GO

