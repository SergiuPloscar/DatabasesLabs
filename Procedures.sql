-- checks if the int value is positive
create function checkNatural (@n int)
returns int as
begin
	declare @no int
	if @n < 0
		set  @no = 0
	else
		set @no = 1
	return @no
end
go

-- checks if nchar is a proper name
create function checkNvarchar(@n nvarchar(10))
returns bit as 
begin 
	declare @b bit 
	if @n  LIKE '[A-Z]%[a-z]' 
		set @b=1 
	else 
		set @b=0 
	return @b
end 
go

-- checks if the int is a month
create function checkMonth (@n int)
returns int as
begin
	declare @no int
	if @n <= 0 OR @n > 12
		set  @no = 0
	else
		set @no = 1
	return @no
end
go

-- checks if the float is a correct price
create function checkPrice (@n float)
returns int as
begin
	declare @no int
	if @n < 0 OR @n > 100
		set  @no = 0
	else
		set @no = 1
	return @no
end
go



-- verifies that the nr of championships is positive and that the team name is an actual name
create procedure addTeams0 @t int, @n nvarchar(10), @nr int
as 
begin 
	if dbo.checkNatural(@nr)=1 and dbo.checkNvarchar(@n)=1 
	begin
		INSERT INTO Teams(Tid,Name, NrOfChampionshipsWon) Values (@t, @n, @nr)
		print 'value added' select * from Teams
	end 
	else
	begin
		print 'the parameters are not correct' 
		select * from Teams 
	end 
end 
go

create procedure addSubcriptions @s int, @nr int, @p float
as 
begin 
	if dbo.checkMonth(@nr)=1 and dbo.checkPrice(@p)=1 
	begin
		INSERT INTO Subscriptions(Sbid,NrOfMonths,PricePerMonth) Values (@s, @nr, @p)
		print 'value added' select * from Subscriptions
	end 
	else
	begin
		print 'the parameters are not correct' 
		select * from Subscriptions
	end 
end 
go

exec addTeams0 @t=6,@n='Rising',@nr=0
exec addTeams0 5,'NewDawn',-3
exec addTeams0 5,'12q1L',4


exec addSubcriptions @s=5,@nr = 3,@p=50
exec addSubcriptions 6,200,14
exec addSubcriptions 6,11,150

