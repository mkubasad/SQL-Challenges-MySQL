-- Challenge: (Advanced Select): Find the type of triangle 

SELECT
    CASE 
        WHEN (A+B <= C) OR (A+C <= B) OR (B+C <= A) THEN 'Not A Triangle'
        WHEN (A=B) AND (B=C) THEN 'Equilateral'
        WHEN (A=B) OR (A=C) OR (B=C) THEN 'Isosceles' -- AND (B!=C) THEN 'Isosceles'
        ELSE 'Scalene' -- WHEN (A!=B) AND (B!=C) AND (A!=C) THEN 'Scalene'
    END AS RESULT
FROM
    TRIANGLES;