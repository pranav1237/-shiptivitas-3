-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
-- Note: Assuming the feature launch date divides the timeline or tracking distinct daily active users (DAU) by date.
-- This query aggregates unique users interacting with cards per day.

SELECT 
    strftime('%Y-%m-%d', datetime(timestamp, 'unixepoch')) AS activity_date,
    COUNT(DISTINCT user_id) AS daily_active_users,
    CASE 
        WHEN strftime('%Y-%m-%d', datetime(timestamp, 'unixepoch')) < '2019-02-01' THEN 'Before Feature'
        ELSE 'After Feature'
    END AS period
FROM card_change_history
GROUP BY activity_date
ORDER BY activity_date;


-- PART 2: Create a SQL query that indicates the number of status changes by card
-- This query returns each card along with how many times its status was updated.

SELECT 
    card_id,
    COUNT(*) AS status_changes_count
FROM card_change_history
GROUP BY card_id
ORDER BY status_changes_count DESC;
