-- MySQL
SELECT CASE WHEN GRADES.GRADE > 7 
        THEN STUDENTS.NAME ELSE 'NULL' 
        END, 
    GRADES.GRADE, STUDENTS.MARKS
FROM STUDENTS 
    JOIN GRADES ON STUDENTS.MARKS BETWEEN GRADES.MIN_MARK AND GRADES.MAX_MARK
ORDER BY GRADES.GRADE DESC, STUDENTS.NAME, STUDENTS.MARKS