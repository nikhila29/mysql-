insert into people(first_name, last_name) values

	('nikki', 'badri'), 

	('vijayalaxmi', 'tellagorla'), 

	('ramadevi', 'badri'),

	('pavan', 'krishna');



select m.title, m.release_year, m.rating, concat(p.first_name, ' ', p.last_name) 
	from movies m , people p where m.director = p.actorID;


	SELECT m.TITLE
      ,CONCAT(pe.FIRST_NAME,' ',pe.LAST_NAME) AS Director
      ,m.RELEASE_YEAR
      ,m.RATING
      ,c.CharacterName
      ,CONCAT(p.FIRST_NAME,' ',p.LAST_NAME) AS Actor
FROM movies m
       INNER JOIN characters c
         ON m.MovieID  = c.MovieID 
       INNER JOIN people p
         ON c.ActorID  = p.ActorID  
       INNER JOIN people pe
         ON m.DIRECTOR = pe.ActorID
WHERE m.TITLE LIKE '%i%';



--subselect----------------------------------------------


 select a.first_name ,
            a.last_name ,
            ifnull(min(c.release_year), 'N/A') as firstDirected
            ,ifnull(max(b.release_year), 'N/A') as latestRelease ,
            d.cnt as moviesdirected from people a 
            left outer join movies b 
                  on b.director = a.actorID 
            left outer join movies c
                  on c.director = b.director
            left outer join 
                  (select z.director as actorID, count(z.movieID) as cnt from movies z group by z.director)  d 
                  on d.actorID = a.actorID 
            group by a.first_name  ,
                  a.last_name, 
                  d.cnt 
            order by d.cnt desc;

SELECT A.FIRST_NAME
      ,A.LAST_NAME
      ,IFNULL(MIN(C.Release_Year),'N/A') AS FirstDirected
      ,IFNULL(MAX(B.Release_Year),'N/A') AS LatestRelease
      ,(SELECT COUNT(Z.MovieID) 
        FROM movies Z
        WHERE Z.Director = A.ActorID) AS MoviesDirected
FROM people A
     LEFT OUTER JOIN movies B
      ON B.director = A.ActorID
     LEFT OUTER JOIN movies C
      ON C.director = B.director   
GROUP BY A.FIRST_NAME
        ,A.LAST_NAME
ORDER BY MoviesDirected DESC; 