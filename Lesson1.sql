/* SQL FOR DATA ANALYSIS - UDEMY

************************************ LIMITs ************************************
/*
1. Try using LIMIT yourself below by writing a query that displays all the data in the occurred_at, account_id,
and channel columns of the web_events table, and limits the output to only the first 15 rows.
*/
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

/* 2.Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd. */
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

/* 3.Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd. */
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

/* 4.Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

************************************ ORDER BYs ***********************************
/*
Questions
1. Write a query that displays the order ID, account ID, and total dollar amount for all the orders,
sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order). */
SELECT id, account_id,total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;

/* 2. Now write a query that again displays order ID, account ID, and total dollar amount for each order,
but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order). */
SELECT id, account_id,total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;

/* Compare the results of these two queries above. How are the results different when you switch the column you sort on first? */
In query #1, all of the orders for each account ID are grouped together, and then within each of those groupings,
the orders appear from the greatest order amount to the least.
In query #2, since you sorted by the total dollar amount first, the orders appear from greatest to least regardless of which account ID they were from. Then they are sorted by account ID next.
(The secondary sorting by account ID is difficult to see here, since only if there were two orders with equal total dollar amounts would there need to be any sorting by account ID.)

************************************ WHEREs ************************************
/* 1. Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000. */
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

/* 2. Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500. */
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

/* 3. Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) just for the Exxon Mobil company in the accounts table. */
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

************************************ Arithmetic Operations ***********************************
/* Questions using Arithmetic Operations
Using the orders table:

1. Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders,
and include the id and account_id fields.*/
SELECT id, account_id, standard_amt_usd/standard_qty as unit_price
FROM orders
LIMIT 10;

/* 2. Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd.
(Try to do this without using the total column.) Display the id and account_id fields also. NOTE - you will receive an error with the correct solution to this question.
This occurs because at least one of the values in the data creates a division by zero in your formula. You will learn later in the course how to fully handle this issue.
For now, you can just limit your calculations to the first 10 orders, as we did in question #1, and you'll avoid that set of data that causes the problem. */

SELECT id, account_id,
       poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;

************************************ Logical Operators ***********************************
