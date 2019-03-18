GO

CREATE FUNCTION ListPolarBears (@n INT)
returns TABLE
return
	select P.PName 
	from PolarBears P
	where P.Pid in 
	( Select P.Pid 
	from PolarBears P INNER JOIN Interactions I on P.Pid = I.Pid
	Group By P.Pid
	HAVING Count(P.Pid) = @n )
	
go
Select * From Interactions
Select * from ListPolarBears(2)