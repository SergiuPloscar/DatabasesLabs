--CREATE TABLE Lootbox ( Lid INT PRIMARY KEY IDENTITY, LName VARCHAR(50), NrOfDrops INT, Price INT UNIQUE )

--CREATE TABLE Item ( Iid INT PRIMARY KEY IDENTITY, IName VARCHAR(50), SetName VARCHAR(50), Value INT )

--CREATE TABLE LootDistribution ( LDid INT PRIMARY KEY IDENTITY, Lid INT FOREIGN KEY REFERENCES Lootbox(Lid), Iid INT FOREIGN KEY REFERENCES Item(Iid) )

Select * From Lootbox
Select * From Item
Select * From LootDistribution

--INSERT INTO Lootbox VALUES ('Combat Pack',3,5)
--INSERT INTO Lootbox VALUES ('Warzone Pack',5,10)
--INSERT INTO Lootbox VALUES ('Elite Pack',5,20)
--INSERT INTO Lootbox VALUES ('Gold Pack',8,35)


INSERT INTO Item VALUES ('Combat Sticker22','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker23','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker24','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker25','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker26','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker27','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker28','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker29','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker30','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker31','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker32','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker33','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker34','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker35','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker36','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker37','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker38','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker39','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker40','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker41','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker42','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker43','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker44','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker45','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker46','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker47','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker48','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker49','Sticker',1)
INSERT INTO Item VALUES ('Combat Sticker50','Sticker',1)
--INSERT INTO Item VALUES ('Camo Vest','Camo',2) 
--INSERT INTO Item VALUES ('Camo Boots','Camo',1) 
--INSERT INTO Item VALUES ('Camo Gloves','Camo',1) 
--INSERT INTO Item VALUES ('Christmas Hat','Christmas',4)  
--INSERT INTO Item VALUES ('Santa Beard','Christmas',2) 
--INSERT INTO Item VALUES ('Elite Knife','Elite',10) 
--INSERT INTO Item VALUES ('Nightvision','Elite',7) 
--INSERT INTO Item VALUES ('Bulletproof Vest','Elite',12) 
--INSERT INTO Item VALUES ('Combat Boots','Elite',9) 
--INSERT INTO Item VALUES ('Eye Patch','Veteran',7) 
--INSERT INTO Item VALUES ('Rusty Knife','Veteran',15) 
--INSERT INTO Item VALUES ('Karambit','Tactical',50) 

--INSERT INTO LootDistribution VALUES (1,1)
--INSERT INTO LootDistribution VALUES (1,2)
--INSERT INTO LootDistribution VALUES (1,3)
--INSERT INTO LootDistribution VALUES (1,4)
--INSERT INTO LootDistribution VALUES (1,5)
--INSERT INTO LootDistribution VALUES (1,6)
--INSERT INTO LootDistribution VALUES (2,5)
--INSERT INTO LootDistribution VALUES (2,6)
--INSERT INTO LootDistribution VALUES (2,7)
--INSERT INTO LootDistribution VALUES (2,8)
--INSERT INTO LootDistribution VALUES (3,7)
--INSERT INTO LootDistribution VALUES (3,8)
--INSERT INTO LootDistribution VALUES (3,9)
--INSERT INTO LootDistribution VALUES (3,10)
--INSERT INTO LootDistribution VALUES (4,7)
--INSERT INTO LootDistribution VALUES (4,8)
--INSERT INTO LootDistribution VALUES (4,9)
--INSERT INTO LootDistribution VALUES (4,10)
--INSERT INTO LootDistribution VALUES (4,11)
--INSERT INTO LootDistribution VALUES (4,12)
--INSERT INTO LootDistribution VALUES (4,13)

Select * From Lootbox

Select Lid, LName from Lootbox
Where Lid > 2

Select LName,NrOfDrops,Price from Lootbox
Where Price = 10

Select * From Lootbox
Order By Price


Go

IF EXISTS (SELECT name FROM sys.indexes where name = 'N_idx_Value')
Drop Index  N_idx_Value on Item;

Go

Create Nonclustered Index N_idx_Value on Item(Value) include (IName);

Go

Select IName,Value from Item 
Where Value = 1 


-- Without index cost is 0.0032963
-- With index cost is    0.0032853  




Go

IF EXISTS (SELECT name FROM sys.indexes where name = 'N_idx_LdLidIid')
Drop Index  N_idx_LdLidIid on LootDistribution;

Go

Create Nonclustered Index N_idx_LdLidIid on LootDistribution(Lid,Iid)

Go


Select L.LName, L.NrOfDrops, I.IName, I.Value
from Lootbox L INNER JOIN LootDistribution LD on L.Lid = LD.Lid INNER JOIN Item I on LD.Iid = I.Iid
Where L.NrOfDrops = 5 OR I.Value Between 1 AND 6


--Without any index, cost is                    0.0163977
--With one index on both foreign keys, cost is  0.01371
--So yes, the efficience of the query can be improved by adding more indexes.
-- An index on the foreign keys helps with speeding up the join operations