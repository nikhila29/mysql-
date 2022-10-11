-- Challenge: Update with Joins

-- Objective: Alter the bowlers table to not keep the individual game scores.  
-- Instead we will have a Running Average score (int) based on the results from bowlresults, ensure the names of the bowlers match in both tables (FNAME and LNAME)

-- You will need need some new functions for this: 
-- AVE() to pull the average of a grouped value 
-- ROUND() will round to an integer * use google to find and see examples of these functions

-- Step 1, drop the unneeded columns from bowlers table:
ALTER TABLE bowling 
 DROP COLUMN Game1
,DROP COLUMN Game2
,DROP COLUMN Game3
,DROP COLUMN Game4;

-- Step 2: Add new column to bowling:
ALTER TABLE bowling
ADD COLUMN AveScore int DEFAULT NULL; 

-- Step 3: Plan the Update
SELECT A.FNAME
      ,A.LNAME
      ,AVG(B.Game_Score) AS RawAveScore
      ,ROUND(AVG(B.Game_Score)) AS AveScore
FROM  bowling A
     ,bowlingResults B
WHERE A.FNAME = B.FNAME
 AND  A.LNAME = B.LNAME
GROUP BY A.FNAME
        ,A.LNAME;    

-- Step 4: Create the update statement from the select

UPDATE bowling A
SET AveScore = (SELECT ROUND(AVG(Game_Score)) AS AveScore
                FROM bowlingResults B 
                WHERE B.FNAME = A.FNAME 
                 AND  B.LNAME = A.LNAME); 
SELECT * FROM bowling;   

