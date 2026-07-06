--                                                       BANK TRANSACTION ANALYSIS
--                                                       TRANSACTION ANALYSIS(TA)

-- TA-01:
-- Transaction Volume by Type

		SELECT TransactionType,
			COUNT(*) AS total_transactions
			FROM transactions
		GROUP BY TransactionType;
        
        
-- TA-02:
-- Transaction volume by payment channel


		SELECT Channel,
			COUNT(*) AS transaction_count
			FROM transactions
		GROUP BY Channel;
        
        
-- TA-03: 
-- Transaction volume by location


		SELECT location,
			COUNT(*) AS total_number
			FROM transactions
		GROUP BY location;


-- TA-04: 
-- Highest spending locations


 
		SELECT Location,
			COUNT(*) AS total_transactions
			FROM transactions
			GROUP BY Location
		ORDER BY total_transactions DESC;
        
-- TA-05:
-- TOP 10 merchants by transaction value

			 SELECT 
              MerchantID, ROUND(SUM(transactionamount),2) AS total_transaction_value
              FROM transactions
             GROUP BY MerchantID
             ORDER BY total_transaction_value DESC LIMIT 10;
             
             
-- TA-06:
-- Top 10 most active customers

 
		SELECT
			AccountID, COUNT(*) AS total_transaction_count
			FROM transactions
		GROUP BY AccountID
		ORDER BY total_transaction_count DESC LIMIT 10;
        
        
-- TA-07:
-- Top 10 Highest Spending Customers


		SELECT
			accountid,
			ROUND(SUM(transactionamount),2) AS total_amount_spent
			FROM transactions
		GROUP BY accountid
		ORDER BY total_amount_spent DESC LIMIT 10 ;
        
        
-- TA-08:
-- Average transaction value by payment channel


		SELECT
			Channel, ROUND(AVG(transactionamount),2) AS avg_transaction_value
			FROM transactions
		GROUP BY channel
		ORDER BY avg_transaction_value DESC;
        
        
-- TA-09:
-- Average transaction duration by payment channel


		SELECT
		    channel, ROUND(AVG(transactionduration),2) AS avg_transaction_duration
		FROM transactions
		GROUP BY channel
		ORDER BY avg_transaction_duration DESC;


-- TA-10: 
-- Customers with the largest single transaction


		SELECT
			accountid, MAX(transactionamount) AS largest_transaction
			FROM transactions
		GROUP BY accountid
		ORDER BY largest_transaction DESC LIMIT 10;