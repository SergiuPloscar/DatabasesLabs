SELECT * From Players
SELECT * From Teams
SELECT * From Games
SELECT * From Players
SELECT * From Subscriptions
SELECT * From GameServers
SELECT * From Players_Games
SELECT * From Games_Subscriptions

--all game servers from europe or that have capacity < 200 players
SELECT * from GameServers
WHERE Location = 'Europe'
UNION
SELECT * from GameServers
WHERE Capacity < 200

--all game servers from europe that also have capacity < 200
SELECT * from GameServers
WHERE Location = 'Europe'
INTERSECT
SELECT * from GameServers
WHERE Capacity < 200

--all game servers from Europe or Asia that have capacity greater or equal to 150
SELECT * from GameServers
WHERE Location = 'Europe' OR Location = 'Asia'
Except
SELECT * from GameServers
WHERE Capacity < 150


SELECT  * from Players p INNER JOIN Players_Games  pg on p.Pid=pg.Pid  INNER JOIN  Games g on pg.Gid = g.Gid
SELECT  * from Players p LEFT JOIN Players_Games  pg on p.Pid=pg.Pid  LEFT JOIN  Games g on pg.Gid = g.Gid
SELECT  * from Games g RIGHT JOIN Players_Games  pg on g.Gid=pg.Gid  RIGHT JOIN  Players p on p.Pid = pg.Pid
SELECT  * from Players p FULL JOIN Players_Games  pg on p.Pid=pg.Pid  FULL JOIN  Games g on pg.Gid = g.Gid

-- Top 3 players ordered alphabetically by nickname that are playing one of the available games
SELECT TOP 3 LName,Nickname
FROM Players p
WHERE p.pid IN ( SELECT Pid FROM Players_Games pg )
ORDER BY Nickname


-- Players whose name doesnt start with B and that are playing  one of the available games, ordered alphabetically by name
SELECT LName,Pid
FROM Players p
WHERE NOT LName LIKE  'B%' AND EXISTS ( SELECT Pid FROM Players_Games pg WHERE p.Pid = pg.Pid )
ORDER BY LName

-- Selects the games that are MOBAs
SELECT DISTINCT *
FROM ( SELECT g.Name, g.Type FROM 
Games g INNER JOIN GameServers s ON g.Gid = s.Gid
WHERE g.Type = 'MOBA') A

-- Nr of players in each team
SELECT p.Tid,COUNT(p.Tid)
FROM Players p INNER JOIN Teams t on p.Tid = t.Tid
GROUP BY p.Tid

-- The Games with a total server capacity of 200 players or more
SELECT s.Gid,SUM(s.Capacity) 
FROM GameServers s INNER JOIN Games g on s.Gid = g.Gid
GROUP BY s.Gid
HAVING SUM(s.Capacity) >=200

-- The max level of a player in a team that won at least one championship
SELECT p.Tid, MAX(pg.PlayerLevel)
FROM Players p INNER JOIN Players_Games  pg on p.Pid=pg.Pid  INNER JOIN  Games g on pg.Gid = g.Gid
GROUP BY p.Tid 
HAVING p.Tid IN ( SELECT t.Tid 
				 FROM Teams t 
				 WHERE t.NrOfChampionshipsWon > 0 )