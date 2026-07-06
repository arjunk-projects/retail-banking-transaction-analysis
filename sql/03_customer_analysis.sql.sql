--                                                     BANK TRANSACTION ANALYSIS
--                                                      CONSUMER ANALYSIS (CA)


-- CA-01:
-- Customer count by occupation


		SELECT
			customeroccupation,
			COUNT(CustomerOccupation) AS total_count
			FROM transactions
		GROUP BY customeroccupation
		ORDER BY total_count DESC;


-- CA-02:
-- Average transaction value by customer occupation


		SELECT
			customeroccupation, ROUND(AVG(transactionamount),2) AS avg_transaction_value
			FROM transactions
		GROUP BY customeroccupation
		ORDER BY avg_transaction_value DESC;
        
        
-- CA-03:
-- Customer age distribution


		SELECT
			MIN(customerage) AS min_customer_age,
			MAX(customerage) AS max_customer_age,
			ROUND(AVG(customerage),1) AS avg_customer_age
		FROM transactions;
        
        
-- CA-04:
-- Average Transaction Value by Age Group

		SELECT
				CASE
				WHEN customerage BETWEEN 18 AND 25 THEN '18-25'
				WHEN customerage BETWEEN 26 AND 35 THEN '26-35'
				WHEN customerage BETWEEN 36 AND 50 THEN '36-50'
				ELSE '51+'
				END AS Age_group,
			ROUND(AVG(transactionamount),2) AS avg_transaction_value
			FROM transactions
		GROUP BY Age_group
		ORDER BY avg_transaction_value DESC;
        
        
-- CA-05:
-- Total transaction value by customer occupation


		SELECT
			CustomerOccupation,ROUND(SUM(transactionamount),2) AS total_transaction_value
		FROM transactions
		GROUP BY customeroccupation
		ORDER BY total_transaction_value DESC;


-- CA-06:
-- Customer Count by Age Group


SELECT
CASE
				WHEN customerage BETWEEN 18 AND 25 THEN '18-25'
				WHEN customerage BETWEEN 26 AND 35 THEN '26-35'
				WHEN customerage BETWEEN 36 AND 50 THEN '36-50'
				ELSE '51+'
				END AS Age_group,
COUNT(customeroccupation) AS customer_count
FROM transactions
GROUP BY Age_group
ORDER BY customer_count DESC;


-- CA-07:
-- Customer occupation performance summary


		SELECT 
			CustomerOccupation,COUNT(*)AS total_customers,
			ROUND(SUM(transactionamount),2)AS total_transaction_amount,
			ROUND(AVG(transactionamount),2)AS avg_transaction_amount,
			ROUND(AVG(transactionduration),2) AS avg_transaction_duration
		FROM transactions
		GROUP BY customeroccupation
		ORDER BY total_transaction_amount DESC;


        
        
        
        
        
        
        
        
        
        
        
        
        
