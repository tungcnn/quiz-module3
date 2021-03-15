CREATE DATABASE quiz;

USE quiz;

CREATE TABLE `user` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `userName` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `host` BOOLEAN
);


CREATE TABLE quiz (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    FOREIGN KEY (id_user)
        REFERENCES user (id),
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

CREATE TABLE answer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_quiz INT,
    id_question INT,
    FOREIGN KEY (id_quiz)
        REFERENCES quiz (id),
    content VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_question)
        REFERENCES question (id),
    correct BOOLEAN
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
    id_answer INT,
    FOREIGN KEY (id_session)
        REFERENCES session(id),
    FOREIGN KEY (id_answer)
        REFERENCES answer (id)
);


INSERT INTO user (name,userName,password,email,host) VALUES
('Son Rau','son','12345','son@gmail.com',1),
('Hien','Tung','12345','d@gmail.com',0);

INSERT INTO quiz (id_user,name,difficulty) VALUES
(1,'Do vui','easy'),
(1,'OOP','normal');

INSERT INTO question (content,id_quiz)VALUES
('Hom Nay An Gi',1),
('Ngay Mai An Gi',1),
('Toi Nay An Gi',1),
('OOP La Gi',2),
('Tinh Dong Goi La Gi',2);


INSERT INTO answer (id_quiz,content,id_question,correct) VALUES
(1,'Pho',1,1),
(1,'Com',1,0),
(1,'Chao',1,0),
(1,'Bum',1,0),
(1,'Pho',3,1),
(1,'Com',3,0),
(1,'Chao',3,0),
(1,'Bum',3,0),
(1,'Pho',2,1),
(1,'Com',2,0),
(1,'Chao',2,0),
(1,'Bum',2,0);

INSERT INTO answer (id_quiz,content,id_question,correct) VALUES
(2,'LT Huong Doi Tuong',4,1),
(2,'LT Thu tuc',4,0),
(2,'C',4,0),
(2,'Ca 2 Deu Dung',4,0),
(2,'Che Giau Du Lieu',5,1),
(2,'LT Thu tuc',5,0),
(2,'C',5,0),
(2,'Ca 2 Deu Dung',5,0);

INSERT INTO session(id_user,id_quiz) VALUES 
(2,1),
(2,2);

INSERT INTO playerAnswer(id_session,id_answer) VALUES 
(1,3),(1,6),(1,12),
(2,16),(2,17);

delimiter $$
create procedure sp_getSessionInfo(
	IN id_session INT
)
BEGIN
SELECT s.id, u.name, qz.name title, q.content question, a.content answer, a.correct result
FROM session s
join user u
on s.id_user = u.id
join quiz qz
on qz.id = s.id_quiz
join answer a
on a.id_quiz = qz.id
join playerAnswer pa
on pa.id_answer = a.id
join question q
on q.id = a.id_question
where s.id = id_session;
END $$

delimiter $$
create procedure sp_getAllQuiz ()
BEGIN
SELECT qz.id as id, qz.name as quizName, qz.difficulty as difficulty, u.name as author
from quiz qz
join user u
on qz.id_user = u.id;
END $$

delimiter $$
create procedure sp_getAllQuestion (
	IN idArgs INT
)
BEGIN
SELECT q.content, a.content 
from question q
join answer a
on q.id = a.id_question
join quiz qz
on qz.id = q.id_quiz
where qz.id = idArgs
group by q.content;
END $$

call sp_getAllQuiz();
call sp_getSessionInfo(2);
call sp_getAllQuestion(1);

 # DROP DATABASE quiz;

SELECT a.id, a.content 
from answer a
join question q
on q.id = a.id_question
where q.id = 5;



