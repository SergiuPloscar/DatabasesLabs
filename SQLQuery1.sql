
insert into Teams(Tid,Name,NrOfChampionshipsWon) VALUES (1,'DallasFuel',0)
insert into Teams(Tid,Name,NrOfChampionshipsWon) VALUES (2,'Cloud9',0)
insert into Teams(Tid,Name,NrOfChampionshipsWon) VALUES (3,'Invictus',2)
insert into Players(Pid,LName,Nickname,Tid) VALUES (1,'Larned','Seagull',1)
insert into Players(Pid,LName,Nickname,Tid) VALUES (2,'Bignet','Akm',1)
insert into Players(Pid,LName,Nickname,Tid) VALUES (3,'Min-seok','OGE',1)
insert into Players(Pid,LName,Nickname,Tid) VALUES (4,'Stidam','Zeydal',2)
insert into Players(Pid,LName,Nickname,Tid) VALUES (5,'Ritchie','Licorice',3)
insert into Players(Pid,LName,Nickname,Tid) VALUES (6,'Peng','Op',3)
insert into Players(Pid,LName,Nickname,Tid) VALUES (7,'Bin','Q',3)
insert into Games(Gid,Name,Type) VALUES (1,'CSGO','FPS')
insert into Games(Gid,Name,Type) VALUES (2,'LOL','MOBA')
insert into Games(Gid,Name,Type) VALUES (3,'DOTA','MOBA')
insert into Subscriptions(Sbid,NrOfMonths,PricePerMonth) VALUES (1,12,10)
insert into Subscriptions(Sbid,NrOfMonths,PricePerMonth) VALUES (2,6,12)
insert into Subscriptions(Sbid,NrOfMonths,PricePerMonth) VALUES (3,3,15)
insert into Subscriptions(Sbid,NrOfMonths,PricePerMonth) VALUES (4,1,20)
insert into GameServers(Sid,Location,Capacity,Gid) VALUES (1,'Europe',30,1)
insert into GameServers(Sid,Location,Capacity,Gid) VALUES (2,'Europe',100,2)
insert into GameServers(Sid,Location,Capacity,Gid) VALUES (3,'Asia',100,2)
insert into GameServers(Sid,Location,Capacity,Gid) VALUES (4,'Asia',200,3)
insert into GameServers(Sid,Location,Capacity,Gid) VALUES (5,'America',100,3)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (1,1,40)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (2,1,30)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (3,1,10)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (1,2,20)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (4,2,100)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (5,2,99)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (6,2,57)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (6,3,99)
insert into Players_Games(Pid,Gid,PlayerLevel) VALUES (7,3,100)
insert into Games_Subscriptions(Gid,Sbid) VALUES (2,1)
insert into Games_Subscriptions(Gid,Sbid) VALUES (2,4)
insert into Games_Subscriptions(Gid,Sbid) VALUES (3,1)
insert into Games_Subscriptions(Gid,Sbid) VALUES (2,2)
insert into Games_Subscriptions(Gid,Sbid) VALUES (3,4)

UPDATE Players
SET Tid=2
WHERE LName LIKE 'R%'

UPDATE GameServers
SET Capacity = 60
WHERE Capacity BETWEEN 0 AND 59

UPDATE Teams
SET NrOfChampionshipsWon = 1
WHERE NrOfChampionshipsWon IS NOT NULL

DELETE FROM Players_Games
WHERE PlayerLevel IN (10,20,30) AND Gid = 1