create view MyView
as
Select g.Name,s.NrOfMonths,srv.capacity
from Subscriptions s INNER JOIN Games_Subscriptions gs on s.Sbid = gs.Sbid 
INNER JOIN Games g on g.Gid = gs.Gid
INNER JOIN GameServers srv on srv.Gid = g.Gid
where srv.Capacity > 50
go

-- get all games and their servers, with a server capacity of  over 50 that also have a yearly subscription available
Select DISTINCT * from MyView
Where NrOfMonths = 12