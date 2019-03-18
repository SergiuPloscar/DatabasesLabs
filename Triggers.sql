
create trigger Add_Team on Teams for insert as
begin
	insert into TeamsTr(Tid,Name,NrOfChampionshipsWon )
	Select Tid,Name,NrOfChampionshipsWon
	from inserted

	insert into logs (TriggerDate,TriggerType,NameOfAffectedTable,NrOfAffectedRows) values (GETDATE(),'INSERT','Teams',@@ROWCOUNT)
end
go

create trigger Update_Team on Teams for update as
begin
	insert into logs (TriggerDate,TriggerType,NameOfAffectedTable,NrOfAffectedRows) values (GETDATE(),'UPDATE','Teams',@@ROWCOUNT)
end
go

create trigger Add_Player on Players for insert as
begin
	insert into PlayersTr(Pid,LName,Nickname,Tid )
	Select Pid,LName,Nickname,Tid
	from inserted

	insert into logs (TriggerDate,TriggerType,NameOfAffectedTable,NrOfAffectedRows) values (GETDATE(),'INSERT','Players',@@ROWCOUNT)
end
go

create trigger Delete_Player on Players for delete as
begin
	insert into PlayersTr(Pid,LName,Nickname,Tid )
	Select Pid,LName,Nickname,Tid
	from deleted
	insert into logs (TriggerDate,TriggerType,NameOfAffectedTable,NrOfAffectedRows) values (GETDATE(),'DELETE','Players',@@ROWCOUNT)
end
go

select * from Teams
select * from TeamsTr
select * from logs
select * from PlayersTr
select * from Players
insert into Players values(11,'Tuk','JPop',3)
insert into Players_Games values (8,1,12)
insert into Teams values (5,'Aurora',2)

update Teams 
set NrOfChampionshipsWon = 1
where Name = 'Aurora'

delete from Players
where Pid = 9

select * from sys.sql_modules
select * from sys.objects