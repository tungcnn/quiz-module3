CREATE DATABASE quiz;

USE quiz;

CREATE TABLE `user` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `userName` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL ,
    `userName` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `host` BOOLEAN
);
# tung test

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
    correct tinyint
);
CREATE TABLE session (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES user(id),
    id_quiz INT,
    FOREIGN KEY (id_quiz) REFERENCES quiz(id),
    score INT,
    date datetime default now() 
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

INSERT INTO quiz (name,difficulty) VALUES
('Do vui','easy'),
('OOP','normal');

delimiter $$
create procedure sp_getAllQuiz()
BEGIN
SELECT qz.id as id, qz.name as quizName, qz.difficulty as difficulty, u.name as author from quiz qz join user u on qz.id_user = u.id;
END $$
delimiter ;

create view questionView as
select qz.id idQuiz, qz.name quizName, qz.difficulty Difficulty, q.id idQuestion, 
q.content, a.content a1, b.content a2, c.content a3, d.content a4, a.correct c1,b.correct c2,c.correct c3,d.correct c4
from answer a
join question q
on q.id = a.id_question
join quiz qz
on qz.id = q.id_quiz
join answer b
on a.id_question = b.id_question and a.id <> b.id 
join answer c
on b.id_question = c.id_question and b.id <> c.id and a.id <> c.id
join answer d
on c.id_question = d.id_question and c.id <> d.id and a.id <> d.id and b.id <> d.id and b.id <> c.id
group by q.id;

select * from questionView;

insert into questionView (quizName, Difficulty, content, a1, a2, a3, a4, c1, c2, c3, c4) values
('Thu do cac nuoc', 'hard', 'Thu do cua VN','HCM','HN','DN','Ca Mau',0,1,0,0);

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
    FROM `answer` `a`
	JOIN `question` `q` ON `q`.`id` = `a`.`id_question`
	JOIN `quiz` `qz` ON `qz`.`id` = `q`.`id_quiz`
	JOIN `answer` `b` ON `a`.`id_question` = `b`.`id_question` AND `a`.`id` <> `b`.`id`
	JOIN `answer` `c` ON `b`.`id_question` = `c`.`id_question` AND `b`.`id` <> `c`.`id` AND `a`.`id` <> `c`.`id`
	JOIN `answer` `d` ON `c`.`id_question` = `d`.`id_question` AND `c`.`id` <> `d`.`id` AND `a`.`id` <> `d`.`id` AND `b`.`id` <> `d`.`id` AND `b`.`id` <> `c`.`id`
    GROUP BY `q`.`id`;
    
    delimiter $$
    create procedure sp_getQuizQuestions (
		IN idQuizArg INT
    )
    BEGIN
    select * from questionView where idQuiz = idQuizArg;
    END $$
    delimiter $$
    
delimiter $$
    create procedure sp_getQuestionsID (
		IN idQuizArg INT
    )
    BEGIN
    select id from question where id_quiz = idQuizArg;
    END $$
    delimiter $$

delimiter $$
    create procedure sp_createSession (
		IN idQuiz INT,
        IN idUser INT
    )
    BEGIN
		insert into session (id_user, id_quiz) values (idUser, idQuiz);
    END $$
    delimiter $$

delimiter $$
    create procedure sp_getLatestIndex (
    )
    BEGIN
    select last_insert_id();
    END $$
    delimiter $$
    
delimiter $$
    create procedure sp_insertPlayerAnswer (
		IN idSession INT,
        IN idQuestion INT,
        IN idAnswer INT
    )
BEGIN
	insert into playeranswer values (idSession, idQuestion, idAnswer);
END $$
delimiter $$
    
delimiter $$
create procedure sp_checkCorrect (
	IN idAnswer INT
)
BEGIN
	select correct 
	from answer
	where id = idAnswer;
END $$
delimiter $$

delimiter $$
create procedure sp_updateScore (
	IN idSession INT,
    IN scoreArg INT
)
BEGIN
	update session 
    set score = scoreArg 
    where id = idSession; 
END $$
delimiter $$

create view userSession as
select s.id as idSession, u.id as idUser, qz.name, qz.difficulty, s.score, s.date as date
from session s
join quiz qz
on qz.id = s.id_quiz
join user u
on u.id = s.id_user;

delimiter $$
create procedure sp_pagination (
	IN idArg INT,
    IN _limit INT,
    IN _offset INT
)
BEGIN
	SELECT * from userSession 
    WHERE idUser = idArg
    ORDER BY date
    LIMIT _limit
    OFFSET _offset;
END $$

delimiter $$
create procedure sp_getTotalPageSession(
	IN idArg INT
)
BEGIN
	SELECT COUNT(*) as total FROM usersession
    WHERE idUser = idArg;
END $$

call sp_getTotalPageSession(2);