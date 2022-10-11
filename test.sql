create table info (id int not null auto_increment, 
	fname varchar(100) default null, 
	lname varchar(100) default null, 
	game1 int default null, 
	game2 int default null, 
	game3 int default null, 
	game4 int default null, primary key(id)); 


insert into info (fname, lname, game1, game2, game3, game4) values

	('nikhila', 'patel', '100', '120', '150', '180'), 

	('vijaya', 'patil', '100', '120', '150', '180'), 

	('rama', 'patel', '180', '190', '150', '180'),

	('nikhi', 'patel', '100', '120', '150', '180');


select concat(lname, ', ', fname) as Player, 
	concat(substring(fname,1,1),substring(lname,1,1)) as Initials, 
	game1 as G1, 
	game2 as G2,
	game3 as G3,
	game4 as G4, 
	game1+game2+game3+game4 as 'total_score', 
	(game1+game2+game3+game4)/4 as 'average_score' from info;

select * from info limit 6;  
-- limit will give the data how many data we need;

select * from info order by 2;

-- order by will give the order of column name or number example order by 2 will give order of column 2 data;

select * from info order by 4;


select * from info order by 4 limit 5;

select * from info order by fname asc;

-- asc ---- 0 to 10 desc ----10 to 0

select * from info order by fname desc;

select * from info order by fname asc, lname desc limit 10;

-- distinct means it will not display duplicants row values

select distinct fname from info;

select count(*) as count_data from info;

select fname , count(*) as count_data from info group by fname;
--group by will group the same data

select * from info where fname like '%ikh%';

--like is for serching data whatever , if we put % before and after string it will show where our string exist it will show

select count(*) from info where fname like '%nikh%';

select max(game1) from info;

select min(game1) from info;

select fname,  min(game1) from info;

SELECT Title       ,MAX(release_year)       ,RATING FROM movies group by title;