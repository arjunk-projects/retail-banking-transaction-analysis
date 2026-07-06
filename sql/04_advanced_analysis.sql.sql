  --                                                               BANK TRANSACTION ANALYSIS
  --                                                                ADVANCED ANALYSIS (AA)
  
  
  
  -- AA-01:
  -- Location performance summary
  
  
		  SELECT
			  location,COUNT(*) AS total_transactions,
			  ROUND(SUM(transactionamount),2)AS total_transaction_amount,
			  ROUND(AVG(transactionamount),2)AS avg_transaction_amount
		  FROM transactions
		  GROUP BY location
		  ORDER BY total_transaction_amount DESC;
          
          
-- AA-02:
-- Merchant performance summary

 
    SELECT
			  merchantid,COUNT(*) AS total_transactions,
			  ROUND(SUM(transactionamount),2)AS total_transaction_amount,
			  ROUND(AVG(transactionamount),2)AS avg_transaction_amount
		  FROM transactions
		  GROUP BY merchantid
		  ORDER BY total_transaction_amount DESC;
  
  
-- AA-03:
-- Occupation × Payment channel analysis

 
		SELECT
			customeroccupation,channel,
			COUNT(*) AS total_transactions
			FROM transactions
		GROUP BY customeroccupation,channel
		ORDER BY CustomerOccupation,total_transactions DESC;


-- AA-04:
-- Age group × payment channel analysis


		SELECT
			CASE
			WHEN customerage BETWEEN 18 AND 25 THEN '18-25'
			WHEN customerage BETWEEN 26 AND 35 THEN '26-35'
			WHEN  customerage BETWEEN 36 AND 50 THEN '36-50'
			ELSE '51+'
			END AS age_group,
		channel,
		COUNT(*) as total_transactions
		FROM transactions
		GROUP BY age_group,channel
		ORDER BY age_group, total_transactions DESC;


-- AA-05:
-- Merchant concentration by location


		SELECT
			location,merchantid,TransactionAmount,
			COUNT(*) AS total_transactions
		FROM transactions
		GROUP BY location,merchantid,transactionamount
		ORDER BY total_transactions DESC;


-- AA-06
-- Top performing merchant by location
-- Uses a CTE and ROW_NUMBER() window function to identify
-- the highest-value merchant in each location.


		WITH MerchantSummary AS (
		SELECT
		  location,merchantid,ROUND(SUM(transactionamount),2) AS total_transaction_value
		FROM transactions
		GROUP BY location,merchantid
		),
        
        RankedMerchants AS (
        SELECT
          location,merchantid,total_transaction_value,
          ROW_NUMBER() OVER(
          PARTITION BY location
          ORDER BY total_transaction_value DESC
        ) AS merchant_rank
        FROM MerchantSummary
        )
        
        SELECT
          location,merchantid,total_transaction_value
          FROM RankedMerchants
		WHERE merchant_rank=1
        ORDER BY location;
        
        
-- AA-07
-- Customer spending summary


		CREATE TABLE customer AS
		SELECT DISTINCT
		    accountid,CustomerAge,customeroccupation
			FROM transactions;
		SELECT
			c.customeroccupation,
			COUNT(*) AS total_transactions,
			ROUND(SUM(t.TransactionAmount),2) AS total_transaction_value,
			ROUND(AVG(t.TransactionAmount),2) AS avg_transaction_value
		FROM customer AS c
		INNER JOIN transactions AS t
			ON c.accountid = t.AccountID
		GROUP BY c.CustomerOccupation
		ORDER BY total_transaction_value DESC;
        
        
-- AA-08:
-- Banking KPI dashboard

 
 
		SELECT
			COUNT(*) total_transactions,
			COUNT(DISTINCT Accountid) AS total_customers,
			ROUND(SUM(transactionamount),2) AS total_transaction_value,
			ROUND(AVG(transactionamount),2) AS avg_transaction_value,
			MAX(transactionamount) AS largest_transaction,
			MIN(transactionamount) AS smallest_transaction,
			ROUND(AVG(customerage),2) AS avg_customer_age,
			COUNT(DISTINCT merchantid) AS total_merchants,
			COUNT(DISTINCT location) AS total_locations
		FROM transactions;


        
        


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  