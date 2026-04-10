     --- Telecome Churn Analysis ---
     --- Tool Stcaks: EXCEL, SQL & POWER BI ----
     -------------------------------------------
     --- Data View ---

SELECT*
FROM [Telecom Churn];

-- Data cleaning and removal of dirty data --
-- Data size and column census -- 
SELECT COUNT(*)   AS Total_rows 
FROM [Telecom Churn];         --------- Data has a total of 7,043 Rows --------

   -- checking for duplicates --
   SELECT customerID, COUNT(*) AS duplicate_count
   FROM [Telecom Churn]
   GROUP BY customerID
   HAVING COUNT(*) > 1;      ---------- Data has zero count of duplicates ------

   -- Data standardization of Fields; YES/NO --
   UPDATE [Telecom Churn]
   SET Partner = UPPER(Partner),
       Dependents = UPPER(Dependents),
       PhoneService = UPPER(PhoneService),
       PaperlessBilling = UPPER(PaperlessBilling),
   Churn = UPPER(Churn);

   -- Converting ofTotal Charges to Numeric if stored as text format --
   ALTER TABLE [Telecom Churn]
   ALTER COLUMN TotalCharges DECIMAL(10,2); 

   -- Checking for negative values --
   -- Tenure --
   SELECT*
   FROM [Telecom Churn]
   WHERE tenure<0;

   -- Checking for Monthly Charges Outliers --
   SELECT*
   FROM [Telecom Churn]
   WHERE MonthlyCharges<0
   OR MonthlyCharges>1000;

   -- verify the clean Data -- 
   SELECT*
   FROM [Telecom Churn]
   WHERE TotalCharges IS NULL;


       -- Full On Data Analysis --
       -- what is the overall churn rate? --
       SELECT 
       COUNT(*)  AS Total_Customers,
       SUM(CASE WHEN churn = '1' THEN 1 ELSE 0 END)  AS churned_customers,  --- where churn = 1 means YES ---
       ROUND(
            SUM(CASE WHEN churn = '1' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2
            )
            AS churn_rate_percent
      FROM [Telecom Churn];
      
      -- which contract type has the highest churn? --
      SELECT 
        Contract,
          COUNT(*) AS customers,
          SUM(CASE WHEN churn = '1' THEN 1 ELSE 0 END)  AS churned,
            ROUND(
                 SUM(CASE WHEN churn = '1' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2
                 )
                 AS churn_rate
      FROM [Telecom Churn]
      GROUP BY Contract
      ORDER BY churn_rate DESC;

      -- Do customers with high monthly charges churn that most? -- 
      SELECT 
        Churn,
        AVG(MonthlyCharges)  AS Avg_Monthly_Charges
      FROM [Telecom Churn]
      GROUP BY Churn;

      -- Does Tenure Influence Churn? customers who leave often indicate onboarding problems -- 
      SELECT
      CASE 
      WHEN Tenure <= 12 THEN '0-1 Year'
      WHEN Tenure <= 24 THEN '1-2 Years'
      WHEN Tenure <= 48 THEN '2-4 Years'

      ELSE '4+ Years'
      END AS Tenure_group,
          COUNT(*) AS Customers,
          SUM(CASE WHEN churn = '1' THEN 1 ELSE 0 END)   AS churned
      FROM [Telecom Churn]
      GROUP BY
          CASE 
          WHEN Tenure <= 12 THEN '0-1 Year'
          WHEN Tenure <= 24 THEN '1-2 Years'
          WHEN Tenure <= 48 THEN '2-4 Years'
      ELSE '4+ Years'
      END;

      -- Which payment methods leads to the highest churn? --
       SELECT
         PaymentMethod,
         COUNT(*)  AS customers,
         SUM( CASE WHEN churn = '1' THEN 1 ELSE 0 END)  AS churned,
         ROUND(
              SUM( CASE WHEN churn = '1' THEN 1 ELSE 0 END) *100.0/COUNT(*),2
              ) 
                AS churn_rate
         FROM [Telecom Churn]
         GROUP BY PaymentMethod
         ORDER BY churn_rate DESC;

      -- Do customers without tech support churn more that those with churn support? -- 
      SELECT
          TechSupport,
        COUNT(*)  AS cutomers,
        SUM( CASE WHEN churn = '1' THEN 1 ELSE 0 END)  AS churned
      FROM [Telecom Churn]
      WHERE TechSupport IS NOT NULL
      GROUP BY TechSupport;

      -- Does internet service type affect churn ? --
      SELECT
        InternetService,
        COUNT(*)  AS customers,
        SUM( CASE WHEN churn = '1' THEN 1 ELSE 0 END)  AS churned
      FROM [Telecom Churn]
      GROUP BY InternetService;

      -- Are senior citizens likely to churn? --
      SELECT 
      SeniorCitizen,
      COUNT(*)  AS customers,
      SUM( CASE WHEN churn = '1' THEN 1 ELSE 0 END)  AS churned,
         ROUND(
            SUM( CASE WHEN churn = '1' THEN 1 ELSE 0 END) *100.0/COUNT(*),2
            )
             AS churn_rate
      FROM [Telecom Churn]
      GROUP BY SeniorCitizen
      ORDER BY churn_rate DESC;

      -- Do customers with dependencies churn less? --
      SELECT 
      Dependents,
          COUNT(*) AS customers,
          SUM(CASE WHEN churn = '1' THEN 1 ELSE 0 END) AS churned
      FROM [Telecom Churn]
      GROUP BY Dependents;

      -- Whuch service combination have the lowest churn? -- 
      SELECT
      OnlineSecurity,
      TechSupport,
          COUNT(*)  AS customers, 
          SUM( CASE WHEN churn = '1' THEN 1 ELSE 0 END)  AS churned
      FROM [Telecom Churn]
      WHERE OnlineSecurity IS NOT NULL AND TechSupport IS NOT NULL
      GROUP BY OnlineSecurity, TechSupport
      ORDER BY churned DESC;

      -- Analytical --
      -- Finding High-Risk Customers --
      -- Showing customers with; Month-to-Month Contract
      --                         High Monthly Charges 
      --                         Low Tenure 
      -- Understanding likely customers to churn next --
      SELECT* 
      FROM [Telecom Churn]
      WHERE Contract = 'Month-to-Month'
      AND MonthlyCharges >70
      AND tenure <12
      AND Churn = '0';
      
      -- ============================================================== --
      -- A total Number of 248 Customers are likely to churn next! --
      -- ============================================================== --