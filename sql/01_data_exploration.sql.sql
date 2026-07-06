--													BANK TRANSACTION ANALYSIS
 --                                                   DATA EXPLORATION(DE)


-- DE-01:
-- Count total transactions


		SELECT COUNT(*) AS total_transactions
		FROM transactions;


-- DE-02:
-- Retrieve unique transaction types


	    SELECT DISTINCT TransactionType FROM transactions;
 

-- DE-03:
-- Retrieve unique payment channels


		SELECT DISTINCT Channel
		FROM transactions;


-- DE-04:
-- Retrieve various locations


		SELECT DISTINCT Location 
		FROM transactions;


-- DE-05:
-- Count various locations


		SELECT COUNT(DISTINCT Location) AS total_locations
		FROM transactions;
			
    
    
-- DE-06:
-- Calculate the average transaction amount


		SELECT ROUND (AVG(Transactionamount)) AS avg_transaction_amount
		FROM transactions;
        
        
-- DE-07:
-- Calculate the minimum and maximum transaction amount  

		SELECT
			MIN(TransactionAmount) AS minimum_transaction_amount,
            MAX(TransactionAmount) AS maximum_transaction_amount
		FROM transactions;


-- DE-08:
-- Check for missing values in key columns


		SELECT COUNT(*) AS missing_transaction_amount
		FROM transactions
		WHERE transactionamount IS NULL
		;
-- to get the results of more key columns, we could use CASE statements to exhibit one single response

		SELECT
			SUM(CASE WHEN transactionamount IS NULL THEN 1 ELSE 0 END) AS missing_transaction_amount,
            SUM(CASE WHEN channel IS NULL THEN 1 ELSE 0 END) AS missing_channel,
            SUM(CASE WHEN transactiontype IS NULL THEN 1 ELSE 0 END) AS missing_transaction_type,
            SUM(CASE WHEN location is NULL then 1 ELSE 0 END) AS missing_location
        FROM transactions;

