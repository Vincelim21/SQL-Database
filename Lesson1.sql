/*
Try using LIMIT yourself below by writing a query that displays all the data in the occurred_at, account_id,
and channel columns of the web_events table, and limits the output to only the first 15 rows.
*/
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

/* Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd. */
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

/* Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd. */
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

/* Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

/* Questions
Write a query that displays the order ID, account ID, and total dollar amount for all the orders,
sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order). */
SELECT id, account_id,total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;

/* Now write a query that again displays order ID, account ID, and total dollar amount for each order,
but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order). */
SELECT id, account_id,total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;

/* Compare the results of these two queries above. How are the results different when you switch the column you sort on first? */
/* In query #1, all of the orders for each account ID are grouped together, and then within each of those groupings,
the orders appear from the greatest order amount to the least. In query #2, since you sorted by the total dollar amount first,
the orders appear from greatest to least regardless of which account ID they were from. Then they are sorted by account ID next.
(The secondary sorting by account ID is difficult to see here, since only if there were two orders with equal total dollar amounts would there need to be any sorting by account ID.) */
