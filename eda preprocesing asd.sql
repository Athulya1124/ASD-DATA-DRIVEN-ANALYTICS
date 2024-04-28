SET SQL_SAFE_UPDATES = 0;
SELECT * FROM autism.data;

select count(*) from data; # count= 28189
desc data; # datatypes
#display the first 5 rows from the dataset
SELECT * FROM autism.data limit 5;
#display the last 5 rows from the dataset
SELECT * FROM autism.data order by 'Invoice ID' desc limit 5;
#display random 5 rows from the dataset
SELECT * FROM autism.data order by rand() limit 5;
ALTER TABLE data
CHANGE COLUMN ï»¿uid uid INT;


#before preprocessing EDA
#mean , median , mode, std, var, skewness , kurtosis
#1 duration
select 
avg(duration) as mean_duration, #mean= 41.69775550746736 
STD(duration) AS std_duration,     #std = 33.427601559666506
  VARIANCE(duration) AS variance_duration    #var= 1117.4045460318187
 from data; 
 
 SELECT 
  duration AS median_duration
FROM (
  SELECT 
    duration,
    ROW_NUMBER() OVER (ORDER BY duration) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM 
    data
) subquery
WHERE 
  row_num = CEIL(total_rows / 2); #median= 33.13
  
  SELECT
  duration AS mode_duration,
  COUNT(duration) AS frequency
FROM
  data
GROUP BY
  duration
ORDER BY
  frequency DESC
LIMIT 1; #mode=1.2 frequency=24

SELECT
  AVG(duration) AS mean_duration,
  STD(duration) AS std_duration,
  (SUM(duration * duration * duration) / COUNT(duration)) / POWER(STD(duration), 3) AS skewness,
  (SUM(duration * duration * duration * duration) / COUNT(duration)) / POWER(STD(duration), 4) AS kurtosis
FROM
  data;   #skewness= 6.38255812619686 #kurtosis=17.57185362349616
 
 select max(duration)-min(duration) from data; #range=129.18
 
  #2 probability
select 
avg(probability) as mean, #mean= 0.90706798284075369
STD(probability) AS std,     #std = 0.1490171673306348
  VARIANCE(probability) AS variance   #var= 0.02220611615924641
 from data; 
 
 SELECT 
  probability AS median
FROM (
  SELECT 
    probability,
    ROW_NUMBER() OVER (ORDER BY probability) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM 
    data
) subquery
WHERE 
  row_num = CEIL(total_rows / 2); #median= 0.9919778
  
  SELECT
  probability AS mode,
  COUNT(probability) AS frequency
FROM
  data
GROUP BY
  probability
ORDER BY
  frequency DESC
LIMIT 1; #mode=1 frequency=3126

SELECT
  AVG(probability) AS mean,
  STD(probability) AS std,
  (SUM(probability * probability * probability) / COUNT(probability)) / POWER(STD(probability), 3) AS skewness,
  (SUM(probability * probability * probability * probability) / COUNT(probability)) / POWER(STD(probability), 4) AS kurtosis
FROM
  data; #skewness= 242.09934507453704 #kurtosis=1558.694959917498
 select max(probability)-min(probability) from data; #range= 0.73113635
 
  #3 fps
  select 
avg(fps) as mean, #mean= 23.1071
STD(fps) AS std,     #std = 8.286731735421082
  VARIANCE(fps) AS variance   #var= 68.6699228543491
 from data; 
 
 SELECT 
  fps AS median
FROM (
  SELECT 
    fps,
    ROW_NUMBER() OVER (ORDER BY fps) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM 
    data
) subquery
WHERE 
  row_num = CEIL(total_rows / 2); #median= 30
  
  SELECT
  fps AS mode,
  COUNT(fps) AS frequency
FROM
  data
GROUP BY
  fps
ORDER BY
  frequency DESC
LIMIT 1; #mode=30 frequency=15319

SELECT
  AVG(fps) AS mean,
  STD(fps) AS std,
  (SUM(fps* fps * fps) / COUNT(fps)) / POWER(STD(fps), 3) AS skewness,
  (SUM(fps * fps * fps * fps) / COUNT(fps)) / POWER(STD(fps), 4) AS kurtosis
FROM
  data; #skewness= 29.525328201697562 #kurtosis=102.67250709491528
  
 select max(fps)-min(fps) from data; #range= 18
#4 asd_project34_video_id
select 
avg(asd_project34_video_id) as mean, #mean= 20.0354
STD(asd_project34_video_id) AS std,     #std = 14.453107609100416
  VARIANCE(asd_project34_video_id) AS variance   #var= 208.89231956023633
 from data; 
 
 SELECT 
  asd_project34_video_id AS median
FROM (
  SELECT 
    asd_project34_video_id,
    ROW_NUMBER() OVER (ORDER BY asd_project34_video_id) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM 
    data
) subquery
WHERE 
  row_num = CEIL(total_rows / 2); #median= 15
  
  SELECT
  asd_project34_video_id AS mode,
  COUNT(asd_project34_video_id) AS frequency
FROM
  data
GROUP BY
  asd_project34_video_id
ORDER BY
  frequency DESC
LIMIT 1; #mode=39 frequency=9768

SELECT
  AVG(asd_project34_video_id) AS mean,
  STD(asd_project34_video_id) AS std,
  (SUM(asd_project34_video_id * asd_project34_video_id * asd_project34_video_id) / COUNT(asd_project34_video_id)) / POWER(STD(asd_project34_video_id), 3) AS skewness,
  (SUM(asd_project34_video_id * asd_project34_video_id * asd_project34_video_id * asd_project34_video_id) / COUNT(asd_project34_video_id)) / POWER(STD(asd_project34_video_id), 4) AS kurtosis
FROM
  data; #skewness= 7.193193987444471 #kurtosis=18.76054911041515
  
   select max(asd_project34_video_id)-min(asd_project34_video_id) from data; #range= 38
  
  #5 uid
  select 
avg(uid) as mean, #mean= 23.1071
STD(uid) AS std,     #std = 8.286731735421082
  VARIANCE(uid) AS variance   #var= 68.6699228543491
 from data; 
 
 SELECT 
  uid AS median
FROM (
  SELECT 
    uid,
    ROW_NUMBER() OVER (ORDER BY uid) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM 
    data
) subquery
WHERE 
  row_num = CEIL(total_rows / 2); #median= 19564
  
  SELECT
  uid AS mode,
  COUNT(uid) AS frequency
FROM
  data
GROUP BY
  uid
ORDER BY
  frequency DESC
LIMIT 1; #mode=3949 frequency=1

SELECT
  AVG(uid) AS mean,
  STD(uid) AS std,
  (SUM(uid* uid * uid) / COUNT(uid)) / POWER(STD(uid), 3) AS skewness,
  (SUM(uid * uid * uid * uid) / COUNT(uid)) / POWER(STD(uid), 4) AS kurtosis
FROM
  data; #skewness= 20.747544704913604 #kurtosis=68.31170014091306
  
  select max(uid)-min(uid) from data; #range= 29709
  
 SET SQL_SAFE_UPDATES = 0;
 
  #missing values
  select count(*) from data where duration is null;
  select count(*) from data where probability is null;
  select count(*) from data where fps is null;
  select count(*) from data where asd_project34_video_id is null;
  select count(*) from data where uid is null; #no null values
  
  delete from data 
  where duration is null or probability is null or fps is null;
  
  #checking duplicates
  
SELECT uid, COUNT(*) AS duplicate_count
FROM data
GROUP BY uid
HAVING COUNT(*) > 1; #no duplicates
 
  
-- Identify duplicate records
CREATE TEMPORARY TABLE temp_duplicate_records AS
SELECT
  uid,
  asd_project34_video_id,
  user_name,
  date_time,
  COUNT(*) AS duplicate_count
FROM
  data
GROUP BY
  uid,
  asd_project34_video_id,
  user_name,
  date_time
HAVING
  COUNT(*) > 1;
  SELECT * FROM temp_duplicate_records; #duplicate records:0
drop table temp_duplicate_records;

DELETE FROM data
WHERE (uid, asd_project34_video_id, user_name, date_time) IN (
    SELECT uid, asd_project34_video_id, user_name, date_time
    FROM temp_duplicate_records
);



#outlier analysis on fps column

WITH orderedList AS (
    SELECT 
        fps,
        ROW_NUMBER() OVER (ORDER BY fps) AS row_n
    FROM data
),
iqr AS (
    SELECT
        fps,
        (
            SELECT fps
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.75)
        ) AS q_three,
        (
            SELECT fps
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.25)
        ) AS q_one
    FROM orderedList
)
SELECT
    COUNT(*) AS outlier_count
FROM iqr
WHERE fps >= (q_three + 1.5 * (q_three - q_one))
   OR fps <= (q_one - 1.5 * (q_three - q_one)); #outlier_count is 0
   
 #outlier analysis on probability column  
 
 WITH orderedList AS (
    SELECT 
        probability,
        ROW_NUMBER() OVER (ORDER BY probability) AS row_n
    FROM data
),
iqr AS (
    SELECT
        probability,
        (
            SELECT probability
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.75)
        ) AS q_three,
        (
            SELECT probability
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.25)
        ) AS q_one
    FROM orderedList
)
SELECT
    COUNT(*) AS outlier_count
FROM iqr
WHERE probability >= (q_three + 1.5 * (q_three - q_one))
   OR probability <= (q_one - 1.5 * (q_three - q_one)); #outlier_count = 3281
   
#outlier analysis on duration column  

   WITH orderedList AS (
    SELECT 
        duration,
        ROW_NUMBER() OVER (ORDER BY duration) AS row_n
    FROM data
),
iqr AS (
    SELECT
        duration,
        (
            SELECT duration
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.75)
        ) AS q_three,
        (
            SELECT duration
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.25)
        ) AS q_one
    FROM orderedList
)
SELECT
    COUNT(*) AS outlier_count
FROM iqr
WHERE duration >= (q_three + 1.5 * (q_three - q_one))
   OR duration <= (q_one - 1.5 * (q_three - q_one)); #outlier_count is 0
   
  #outlier analysis on asd_project34_video_id column
  
  WITH orderedList AS (
    SELECT 
        asd_project34_video_id,
        ROW_NUMBER() OVER (ORDER BY asd_project34_video_id) AS row_n
    FROM data
),
iqr AS (
    SELECT
        asd_project34_video_id,
        (
            SELECT asd_project34_video_id
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.75)
        ) AS q_three,
        (
            SELECT asd_project34_video_id
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.25)
        ) AS q_one
    FROM orderedList
)
SELECT
    COUNT(*) AS outlier_count
FROM iqr
WHERE asd_project34_video_id >= (q_three + 1.5 * (q_three - q_one))
   OR asd_project34_video_id <= (q_one - 1.5 * (q_three - q_one)); # outlier_count is 0
   
 #outlier analysis on uid
 WITH orderedList AS (
    SELECT 
        uid,
        ROW_NUMBER() OVER (ORDER BY uid) AS row_n
    FROM data
),
iqr AS (
    SELECT
        uid,
        (
            SELECT uid
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.75)
        ) AS q_three,
        (
            SELECT uid
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM data) * 0.25)
        ) AS q_one
    FROM orderedList
)
SELECT
    COUNT(*) AS outlier_count
FROM iqr
WHERE uid >= (q_three + 1.5 * (q_three - q_one))
   OR uid <= (q_one - 1.5 * (q_three - q_one)); #outlier_count is 0
   
set sql_safe_updates = 0;

#outlier treatment using winsorization method

   -- Find the 5th Percentile
SET @p5 = (SELECT MAX(probability) AS fifth_percentile
           FROM (SELECT probability, NTILE(100) OVER (ORDER BY probability) AS ntiles
                 FROM autism.data) AS ntile_data
           WHERE ntiles = 5);

-- Find the 95th Percentile
SET @p95 = (SELECT MAX(probability) AS ninetyfifth_percentile
            FROM (SELECT probability, NTILE(100) OVER (ORDER BY probability) AS ntiles
                  FROM autism.data) AS ntile_data
            WHERE ntiles = 95);

-- Update 'probability' column with Winsorization
UPDATE autism.data
SET probability =
  CASE
    WHEN probability < @p5 THEN @p5
    WHEN probability > @p95 THEN @p95
    ELSE probability
  END;
  
  -- Count outliers before winsorization
SELECT COUNT(*) AS outliers_before
FROM autism.data
WHERE probability < @p5 OR probability > @p95;

-- Update 'probability' column with Winsorization
UPDATE autism.data
SET probability =
  CASE
    WHEN probability < @p5 THEN @p5
    WHEN probability > @p95 THEN @p95
    ELSE probability
  END;

-- Count outliers after winsorization
SELECT COUNT(*) AS outliers_after
FROM autism.data
WHERE probability < @p5 OR probability > @p95;


-- Create a new table for cleaned data
CREATE TABLE autism.cleaned_data AS
SELECT *
FROM autism.data;

-- Update 'probability' column with Winsorization
UPDATE autism.cleaned_data
SET probability =
  CASE
    WHEN probability < @p5 THEN @p5
    WHEN probability > @p95 THEN @p95
    ELSE probability
  END;



-- Verify the data in the cleaned_data table
SELECT * FROM autism.cleaned_data;

select 
avg(probability) as mean, #mean= 0.9103998310830639
STD(probability) AS std,     #std = 0.13949587172792616
  VARIANCE(probability) AS variance   #var= 0.01945909822913403 
 from cleaned_data; 
 
 SELECT 
  probability AS median
FROM (
  SELECT 
    probability,
    ROW_NUMBER() OVER (ORDER BY probability) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM 
    cleaned_data
) subquery
WHERE 
  row_num = CEIL(total_rows / 2); #median= 0.9919778
  
  SELECT
  probability AS mode,
  COUNT(probability) AS frequency
FROM
  cleaned_data
GROUP BY
  probability
ORDER BY
  frequency DESC
LIMIT 1; #mode=1 frequency=3126

SELECT
  AVG(probability) AS mean,
  STD(probability) AS std,
  (SUM(probability * probability * probability) / COUNT(probability)) / POWER(STD(probability), 3) AS skewness,
  (SUM(probability * probability * probability * probability) / COUNT(probability)) / POWER(STD(probability), 4) AS kurtosis
FROM
  cleaned_data; #skewness= 296.0503508220595 #kurtosis= 2034.2685476419135
 select max(probability)-min(probability) from cleaned_data; #range= 0.44622516999999995
 
 
 # video details
 SELECT * FROM autism.videodetails;
 
 select count(*) from videodetails; # count= 41
desc videodetails; # datatypes
#display the first 5 rows from the dataset
SELECT * FROM videodetails limit 5;
#display random 5 rows from the dataset
SELECT * FROM videodetails order by rand() limit 5;
ALTER TABLE videodetails
CHANGE COLUMN ï»¿video_id video_id INT;

#before preprocessing EDA
#mean , median , mode, std, var, skewness , kurtosis
#1 length
select 
avg(length) as mean, #mean=  24.3902
STD(length) AS length,     #std = 20.30484508896468
  VARIANCE(length) AS variance    #var= 412.286734086853
 from videodetails; 
 
 SELECT 
  length AS median
FROM (
  SELECT 
    length,
    ROW_NUMBER() OVER (ORDER BY length) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM 
    videodetails
) subquery
WHERE 
  row_num = CEIL(total_rows / 2); #median= 14
  
  SELECT
  length AS mode,
  COUNT(length) AS frequency
FROM
  videodetails
GROUP BY
  length
ORDER BY
  frequency DESC
LIMIT 1; #mode=11 frequency=13

SELECT
  AVG(length) AS mean,
  STD(length) AS std,
  (SUM(length * length * length) / COUNT(length)) / POWER(STD(length), 3) AS skewness,
  (SUM(length * length * length * length) / COUNT(length)) / POWER(STD(length), 4) AS kurtosis
FROM
  videodetails;   #skewness= 6.215725622515983  #kurtosis= 16.933094889732548
 
 select max(length)-min(length) from videodetails; #range=55
 
 #missing values
  select count(*) from videodetails where length is null; # no missing values
  
  SELECT video_id, COUNT(*) AS duplicate_count
FROM videodetails
GROUP BY video_id
HAVING COUNT(*) > 1; 

 #outlier analysis 

   WITH orderedList AS (
    SELECT 
        length,
        ROW_NUMBER() OVER (ORDER BY length) AS row_n
    FROM videodetails
),
iqr AS (
    SELECT
        length,
        (
            SELECT length
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM videodetails) * 0.75)
        ) AS q_three,
        (
            SELECT length
            FROM orderedList
            WHERE row_n = FLOOR((SELECT COUNT(*) FROM videodetails) * 0.25)
        ) AS q_one
    FROM orderedList
)
SELECT
    COUNT(*) AS outlier_count
FROM iqr
WHERE length >= (q_three + 1.5 * (q_three - q_one))
   OR length <= (q_one - 1.5 * (q_three - q_one)); #outlier_count is 0
