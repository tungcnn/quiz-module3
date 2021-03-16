CREATE DATABASE quiz;

USE quiz;

CREATE TABLE `user` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL ,
    `userName` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `host` BOOLEAN
);


CREATE TABLE quiz (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    difficulty VARCHAR(15) CHECK (difficulty IN ('easy' , 'normal', 'hard'))
);

CREATE TABLE question (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    id_quiz INT,
    FOREIGN KEY (id_quiz)
        REFERENCES quiz (id)
);
create table answer (
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_question INT,
    FOREIGN KEY (id_question)
        REFERENCES question (id),
	id_quiz INT,
    FOREIGN KEY (id_quiz)
        REFERENCES quiz (id),
	content varchar(255),
    correct boolean
);
CREATE TABLE session (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES user(id),
    id_quiz INT,
    FOREIGN KEY (id_quiz) REFERENCES quiz(id),
    score INT
);
CREATE TABLE playerAnswer (
    id_session INT,
    id_question INT,
    id_answer INT,
    FOREIGN KEY (id_session)
        REFERENCES session(id),
    FOREIGN KEY (id_question)
        REFERENCES question (id),
	FOREIGN KEY (id_answer)
        REFERENCES answer (id)
);


INSERT INTO user (name,userName,password,email,host) VALUES
('Son Rau','son','12345','son@gmail.com',1),
('Hien','Tung','12345','d@gmail.com',0);

INSERT INTO quiz (id_user,name,difficulty) VALUES
(1,'Do vui','easy'),
(1,'OOP','normal');

INSERT INTO question (content,id_quiz) VALUES
('Hom Nay An Gi',1),
('Ngay Mai An Gi',1),
('Toi Nay An Gi',1),
('OOP La Gi',2),
('Tinh Dong Goi La Gi',2);
insert into answer (id_question, id_quiz, content, correct) values 
(1, 1, 'Pho', 0),
(1, 1, 'Bun', 0),
(1, 1, 'Mien', 1),
(1, 1, 'Chao', 0),
(2, 1, 'Pizza', 1),
(2, 1, 'Pasta', 0),
(2, 1, 'Lasagna', 0),
(2, 1, 'Ketchup', 0),
(3, 1, 'Vodka', 0),
(3, 1, 'Gin', 0),
(3, 1, 'Rum', 0),
(3, 1, 'Nep Cai Hoa Vang', 1),
(4, 2, 'LT HDT', 1),
(4, 2, 'LT HTT', 0),
(4, 2, 'Ca 2 dung', 0),
(4, 2, 'Ca 2 sai', 0),
(5, 2, 'Abstraction', 0),
(5, 2, 'Encapsulation', 1),
(5, 2, 'Polymorphism', 0),
(5, 2, 'Inheritance', 0);

delimiter $$
CREATE PROCEDURE sp_getAllQuiz()
BEGIN
SELECT id as id, name as quizName, difficulty as difficulty 
from quiz qz;
END $$

delimiter $$
CREATE VIEW `questionview` AS
    SELECT 
        `qz`.`id` AS `idQuiz`,
        `qz`.`name` AS `quizName`,
        `qz`.`difficulty` AS `Difficulty`,
        `q`.`id` AS `idQuestion`,
        `q`.`content` AS `content`,
        `a`.`content` AS `a1`,
        `b`.`content` AS `a2`,
        `c`.`content` AS `a3`,
        `d`.`content` AS `a4`,
        `a`.`correct` AS `c1`,
        `b`.`correct` AS `c2`,
        `c`.`correct` AS `c3`,
        `d`.`correct` AS `c4`
    FROM
        (((((`answer` `a`
        JOIN `question` `q` ON ((`q`.`id` = `a`.`id_question`)))
        JOIN `quiz` `qz` ON ((`qz`.`id` = `q`.`id_quiz`)))
        JOIN `answer` `b` ON (((`a`.`id_question` = `b`.`id_question`)
            AND (`a`.`id` <> `b`.`id`))))
        JOIN `answer` `c` ON (((`b`.`id_question` = `c`.`id_question`)
            AND (`b`.`id` <> `c`.`id`)
            AND (`a`.`id` <> `c`.`id`))))
        JOIN `answer` `d` ON (((`c`.`id_question` = `d`.`id_question`)
            AND (`c`.`id` <> `d`.`id`)
            AND (`a`.`id` <> `d`.`id`)
            AND (`b`.`id` <> `d`.`id`)
            AND (`b`.`id` <> `c`.`id`))))
    GROUP BY `q`.`id`;