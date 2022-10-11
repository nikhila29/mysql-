CREATE TABLE CustBal (CustID int NOT NULL AUTO_INCREMENT
            ,CheckingBalance DECIMAL(8,2)
            ,SavingsBalance DECIMAL(8,2)
            ,CreditCardBalance DECIMAL(8,2)
            ,CreditCardTotalCredit DECIMAL(8,2)
            ,CreditCardAvailableCredit DECIMAL(8,2)
            ,TotalBalance DECIMAL(8,2)
            ,ActiveStatus boolean
            ,primary key (CustID));

INSERT INTO CustBal ( CheckingBalance
                     ,SavingsBalance
                     ,CreditCardBalance
                     ,CreditCardTotalCredit
                     ,CreditCardAvailableCredit
                     ,TotalBalance
                     ,ActiveStatus)
VALUES (835.27 , 2223.01 ,   123.09 ,  1000.00 , NULL , NULL , 1)
      ,(165.27 , 1223.01 ,     0.00 ,  1000.00 , NULL , NULL , 1)
      ,(899.27 , 3223.01 ,  9125.09 , 20000.00 , NULL , NULL , 1)
      ,(  0.00 ,    0.00 ,    00.00 ,     0.00 , NULL , NULL , 0)      
      ,(123.27 , 4223.01 ,   123.00 ,   800.00 , NULL , NULL , 1)
      ,( 65.00 , 6223.01 , 21123.09 , 20000.00 , NULL , NULL , 1)
      ,(315.90 , 7223.01 ,     0.00 , 21000.00 , NULL , NULL , 1)
      ,(992.22 , 1923.01 , 20000.00 , 20000.00 , NULL , NULL , 1)
      ,( 75.21 , 4223.01 ,  1123.51 , 15000.00 , NULL , NULL , 1)
      ,(165.22 ,    0.01 , 15123.08 , 16000.00 , NULL , NULL , 0)
      ,(455.23 ,    0.00 ,  4123.00 ,  5000.00 , NULL , NULL , 1);

SELECT CustID
      ,CreditCardTotalCredit
      ,CreditCardBalance 
      ,CreditCardAvailableCredit  AS OldCreditCardAvailableCredit
      ,CreditCardTotalCredit - CreditCardBalance AS NewCreditCardAvailableCredit
FROM CustBal 
WHERE ActiveStatus = 1;


SELECT CustID
      ,CheckingBalance
      ,SavingsBalance
      ,CreditCardBalance
      ,TotalBalance  AS OldTotalBalance 
      ,CheckingBalance + SavingsBalance - CreditCardBalance  AS NewTotalBalance 
FROM CustBal 
WHERE ActiveStatus = 1;

Delete from CustBal where CustID = 1;

