## In the Assignment 4 questions were given , I have used sql queries to solve each one of them

### Question 1. We have find the no of male and female employees in each department
```
SELECT Department,
SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS "Num of male",
SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS "Num of Female"
FROM employees
GROUP BY Department;
```
So for counting department wise males and females, we need to use group by department. Then I have used Sum function to add  if the condtion is satisfied.
Case expression goes through the condtion and it return value 1 if first condtion is met and it return  0 if condtion is not satisfied (like an if-else statement). Hence The above query gives the desired output.


### Question2.  Given a table with salaries of employees for different month, find the max amount from the rows with month name:

```
SELECT Name, 
  ANY_VALUE(CASE 
    WHEN Jan = GREATEST(Jan, Feb, Mar) THEN 'Jan'
    WHEN Feb = GREATEST(Jan, Feb, Mar) THEN 'Feb'
    WHEN Mar = GREATEST(Jan, Feb, Mar) THEN 'Mar'
  END) AS Month,
  GREATEST(Jan, Feb, Mar) AS Value
FROM emp_salary
```
So we have to choose the max salary and corresponding month for each person X,Y,Z,W. So I have used any_value function to choose any month (jan,fab, march in our case) which satisfies the condtion that salary is greatest. Again Case expression is used to check which month is greatest and we also returning the max amount as value.


### Question3 Given the marks obtained by candidates in a test, rank them in proper order.

```
SELECT Marks, 
       DENSE_RANK() OVER (ORDER BY Marks DESC) AS `Ranking`, 
       GROUP_CONCAT(Candidate_ID ORDER BY Candidate_ID ASC) AS Candidate_ID
FROM candidate_marks
GROUP BY Marks
ORDER BY `Ranking`;
```
To solve this query I have used Dense_Rank() function which assigns the rank to each row . Here we are assigning top rank to highest mark, that's why I have used order by marks desc. Since more than one student can get the same mark so their rank should also be the same . For this i have used the group_concat function to concat the candidate_id.


### Question4 We need to delete the rows if their email id is same keeping only the smallest id row.

```
DELETE c1
FROM candidate_emails c1
JOIN candidate_emails c2
ON c1.Email = c2.Email AND c1.Candidate_ID > c2.Candidate_ID;
```
To solve this query I have used join on the same table(self join). We are deleting the rows from table c1 based on condtion that c1.email_id is equal to c2.email_id and c1.candidate_id is greater than c2.candidate_id.
I


