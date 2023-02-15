## In the Assignment 4 questions were given , I have used sql queries to solve each one of them

###Question 1. We have find the no of male and female employees in each department
```
SELECT Department,
SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS "Num of male",
SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS "Num of Female"
FROM employees
GROUP BY Department;
```
So for counting department wise males and females, we need to use group by department. Then I have used Sum function to add  if the condtion is satisfied.
Case expression goes through the condtion and it return value 1 if first condtion is met and it return  0 if condtion is not satisfied (like an if-else statement). Hence The above query gives the desired output.


