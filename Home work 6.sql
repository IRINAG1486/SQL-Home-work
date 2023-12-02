DELIMITER //
SELECT VERSION()//

/*
2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
*/

DROP PROCEDURE IF EXISTS EvenNumb//
CREATE PROCEDURE EvenNumb()
BEGIN
  DECLARE i INT DEFAULT 0;
  DROP TABLES IF EXISTS numbers;
  CREATE TABLE numbers (num INT);
  
  WHILE i <= 10 DO
	SET i = i + 1;
    IF i % 2 = 0 THEN
	  INSERT INTO numbers VALUES (i);
	END IF;
  END WHILE;
  SELECT * FROM numbers;
End//

CALL EvenNumb()//

/*
1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней часов минут. 
   Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DROP FUNCTION IF EXISTS  ChangeSec//
CREATE FUNCTION ChangeSec(seconds INT)
RETURNS VARCHAR (255) DETERMINISTIC
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE message VARCHAR (255);
  
  WHILE seconds >= 86400 DO
	SET days = seconds / 86400;
    SET seconds = seconds % 86400;
  END WHILE;
  
  WHILE seconds >= 3600 DO
	SET hours = seconds / 3600;
    SET seconds = seconds % 3600;
  END WHILE;
  
  WHILE seconds >= 60 DO
	SET minutes = seconds / 60;
    SET seconds = seconds % 60;
  END WHILE;
  
  SET message = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
  RETURN message;
END//

SELECT ChangeSec(123456) AS Change_seconds//
  
	  

