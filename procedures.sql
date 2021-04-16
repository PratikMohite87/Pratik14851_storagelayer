use storagelayer;

create table proceduretable (
noId int,
textField varchar(10)
); 

select * from proceduretable;

delimiter //
create procedure abc()
begin
	declare a int default 10;
	insert into proceduretable values (a,"first");
    
    set a = 15;
    
    insert into proceduretable values (a,"second");
end;//
delimiter ;

call abc;

delimiter //
create procedure abc2(out b int)
begin
	select count(*) into b from proceduretable;
end; //
delimiter ;

call abc2(@returnedvalue);		-- variable starting with @ stands for user defined variable.

-- extra knowledge

select @returnedvalue;
set @c = "noId";
set @s = concat("select ",@c," from proceduretable");
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;

-- extra knowledge