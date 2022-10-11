-- Create a table with your four best friends first names, last names and their birthdays.
-- Create a report which will return the following:
-- 1. First and last name together in one column
-- 2. Current Age
-- 3. Create a column - if birthday is today, return ‘Call Today’, else if birthday is less than 14 days, display ‘Send Card”, else display Birthday is in (name of month).
-- 4. Only return friends that are within the next 6 months.
-- 5. Test your report by replacing current date with various hard coded dates.


CREATE TABLE bestfriends (personID INT NOT NULL AUTO_INCREMENT
                    ,FNAME varchar(50) DEFAULT NULL
                    ,LNAME varchar(50) DEFAULT NULL
                    ,dob date DEFAULT NULL 
                    ,PRIMARY KEY (personID));

INSERT INTO bestfriends (FNAME, LNAME,dob)
    VALUES ('suresh', 'Badri','1992-11-15')
        ,('rama', 'patel','1999-08-29')
        ,('vijaya', 'tellagorla','1998-10-21')
        ,('pavan', 'krishna','1999-12-03');

select concat(fname, ' ', lname) as 'Full Name'
    from bestfriends;

select concat(fname, ' ', lname) as 'Full Name' 
    , dob
    , CURDATE()
    , TIMESTAMPDIFF(Year, dob, CURDATE()) as 'age'
    ,STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y') AS "Birthday This Year"
    ,DATE_ADD( STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y'), INTERVAL 1 YEAR ) AS "Birthday Next Year"
    ,DATE_ADD(CURDATE(), INTERVAL 6 month) as '6 months',
    monthname(dob) as 'Birth month'
    from bestfriends;

SELECT CONCAT(FNAME,' ',LNAME)  AS Friend
      ,TIMESTAMPDIFF(YEAR,dob,CURDATE()) AS AGE
      ,CASE
         WHEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y') = CURDATE()
           THEN 'Call Today'
         WHEN CASE 
                WHEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y') >= CURDATE()
                  THEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y')
                ELSE DATE_ADD( STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y'), INTERVAL 1 YEAR )
              END <= DATE_ADD(CURDATE(), INTERVAL 14 DAY)  
           THEN 'Send a card'
         ELSE concat('Birthday is in ',MONTHNAME(dob))
       END AS ToDo
FROM bestfriends

-- WHERE CASE 
--          WHEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y') >= CURDATE()
--            THEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y')
--          ELSE DATE_ADD( STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y'), INTERVAL 1 YEAR )
--        END BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH);



-- That's it! now let's test it with hardcoding different dates:
-- Find and replace works wonders.

SELECT CONCAT(FNAME,' ',LNAME)  AS Friend
        ,TIMESTAMPDIFF(YEAR,dob,'2016-08-05') AS AGE
        ,CASE
            WHEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR('2016-08-05')),'%m/%d/%Y') = '2016-08-05'
            THEN 'Call Today'
            WHEN CASE 
                WHEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR('2016-08-05')),'%m/%d/%Y') >= '2016-08-05'
            THEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR('2016-08-05')),'%m/%d/%Y')
                ELSE DATE_ADD( STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR('2016-08-05')),'%m/%d/%Y'), INTERVAL 1 YEAR )
              END <= DATE_ADD('2016-08-05', INTERVAL 14 DAY)  
           THEN 'Send a card'
         ELSE concat('Birthday is in ',MONTHNAME(dob))
       END AS ToDo
FROM bestfriends
WHERE CASE 
         WHEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR('2016-08-05')),'%m/%d/%Y') >= '2016-08-05'
           THEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR('2016-08-05')),'%m/%d/%Y')
         ELSE DATE_ADD( STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR('2016-08-05')),'%m/%d/%Y'), INTERVAL 1 YEAR )
       END BETWEEN '2016-08-05' AND DATE_ADD('2016-08-05', INTERVAL 6 MONTH)
       ;