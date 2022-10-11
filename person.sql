CREATE TABLE person (personID INT NOT NULL AUTO_INCREMENT
                    ,FNAME varchar(50) DEFAULT NULL
                    ,LNAME varchar(50) DEFAULT NULL
                    ,dob date DEFAULT NULL 
                    ,PRIMARY KEY (personID));

INSERT INTO person (FNAME, LNAME,dob)
VALUES ('suresh', 'Badri','1981-12-25')
      ,('mahesh', 'mahi','1985-01-03');

SELECT dob AS Birthdays
      ,CURDATE()   AS Today
FROM person;


SELECT dob AS "Birthday"
      ,CURDATE()   AS Today
      ,TIMESTAMPDIFF(YEAR,dob,CURDATE()) AS AGE
FROM person;    


SELECT FNAME
      ,dob AS Birthday
      ,CURDATE()   AS Today
      ,STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y') AS "Birthday This Year"
      ,DATE_ADD( STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y'), INTERVAL 1 YEAR ) AS "Birthday Next Year"
FROM person;


SELECT FNAME
      ,dob AS Birthday
      ,CURDATE()   AS Today
      ,STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y') AS "Birthday This Year"
      ,DATE_ADD( STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y'), INTERVAL 1 YEAR ) AS "Birthday Next Year"
      ,CASE 
         WHEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y') >= CURDATE()
           THEN STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y')
         ELSE DATE_ADD( STR_TO_DATE(CONCAT(MONTH(dob),'/',DAY(dob),'/',YEAR(CURDATE())),'%m/%d/%Y'), INTERVAL 1 YEAR )
       END AS "Next Birthday"
FROM person;