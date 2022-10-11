create table bowlingResults(id int not null auto_increment, 
	fname varchar(100) default null, 
	lname varchar(100) default null, 
	game_num int default null, 
	game_score int default null, 
	primary key(id)); 

insert into bowlingResults (fname, lname, game_num, game_score) values

	('nikhila', 'patel', '1', '125'), 

	('vijaya', 'tellagorla', '2', '188'), 

	('rama', 'badri', '4', '185'),

	('krish', 'thokala', '5', '193');

select concat(fname, ' ', lname) as player , 
	sum(game_score) as 'tournament total' , 
	sum(game_score)/count(*) as 'tounament average' from bowlingResults 
	group by fname, lname 
	order by sum(game_score)/count(*) desc 
	limit 3;

select concat(fname, ' ', lname) as player 
	,max(game_score) as 'best game'
	from bowlingResults
	group by fname, lname
	order by max(game_score) desc;

select distinct fname as 'first name'
    ,lname as 'last name'
    from bowlingResults;

select fname, lname, game_score from bowlingResults where game_score > 150;

select fname, lname, game_score from bowlingResults where game_score between 150 and 200;

select fname, lname, game_score from bowlingResults where game_score <> 125; --<> --not equal

select fname, lname, game_score from bowlingResults where game_score in (125,188);

select fname, lname, game_score from bowlingResults where game_score not in (125,188);

select fname, lname, game_score from bowlingResults where game_score >= 150 AND game_score <= 200;

select fname, lname, game_score from bowlingResults where (fname = 'n' OR lname like '%pat%');

select * from bowlingResults where lname is null;

select * from bowlingResults where lname is not null;

select fname, lname, game_score, case 
	when game_score='125' then 'iam 125' 
	when game_score='188' then 'iam 188' 
	else 'no information'
	end as information from bowlingResults;

update bowlingResults set fname = suresh where id =16;

