CREATE DATABASE board_back;


CREATE USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';
FLUSH PRIVILEGES;


USE board_back;

CREATE TABLE IF NOT EXISTS board (
    no INT PRIMARY KEY,
    contents VARCHAR(255),
    member_Id INT,
    title VARCHAR(255)
);

INSERT INTO board (no, contents, member_Id, title)
VALUES 
    (1,  'ContentsValue1', 123, 'TitleValue1'),
    (2,  'ContentsValue2', 456, 'TitleValue2'),
    (3,  'ContentsValue3', 789, 'TitleValue3');
