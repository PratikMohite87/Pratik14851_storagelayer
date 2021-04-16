use storagelayer;

create table lefttable (
value int);

create table righttable (
value int);

insert into lefttable values (1),(2),(3),(4);
insert into righttable values (3),(4),(5),(6);

select * from lefttable;
select * from righttable;

drop table lefttable;

select * from lefttable
left join 
righttable on lefttable.value = righttable.value;

select * from lefttable
right join 
righttable on lefttable.value = righttable.value;

select * from lefttable
full join 			-- we dont have a full outer join in mysql but we can emulate it using union
righttable on lefttable.value = righttable.value;

select * from lefttable
left join 
righttable on lefttable.value = righttable.value
union all		-- union removes duplicate, union all keeps duplicate
select * from lefttable
right join 
righttable on lefttable.value = righttable.value;

select * from lefttable
cross join -- cross join / cartesian join.
righttable;