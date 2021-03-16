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
	id int primary key auto_increment,
    id_question int,
    foreign key (id_question) references question(id),
    id_quiz int,
    foreign key (id_quiz) references quiz(id),
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
    FOREIGN KEY (id_session)
        REFERENCES session(id),
    FOREIGN KEY (id_question)
        REFERENCES question (id),
	id_answer int,
    FOREIGN KEY (id_answer)
        REFERENCES answer (id)
);


INSERT INTO user (name,userName,password,email,host) VALUES
('Son Rau','son','12345','son@gmail.com',1),
('Hien','Tung','12345','d@gmail.com',0);

INSERT INTO quiz (name,difficulty) VALUES
('Do vui','easy'),
('OOP','normal');

INSERT INTO question (content,id_quiz)VALUES
('Hom Nay An Gi',1),
('Ngay Mai An Gi',1),
('Toi Nay An Gi',1),
('OOP La Gi',2),
('Tinh Dong Goi La Gi',2);

insert into answer (id_question, id_quiz, content, correct) values 
(1, 1, 'Pho', 0),
(1, 1, 'Bun', 0),
(1, 1, 'Mien', 0),
(1, 1, 'Chao', 1);

insert into answer (id_question, id_quiz, content, correct) values 
(2, 1, 'Pizza', 0),
(2, 1, 'Pasta', 1),
(2, 1, 'Lasagna', 0),
(2, 1, 'Ketchup', 0);

insert into answer (id_question, id_quiz, content, correct) values 
(3, 1, 'Vodka', 1),
(3, 1, 'Gin', 0),
(3, 1, 'Rum', 0),
(3, 1, 'Nep cai hoa vang', 0);

insert into answer (id_question, id_quiz, content, correct) values 
(4, 2, 'LT HDT', 0),
(4, 2, 'LT HTT', 0),
(4, 2, 'Ca 2 deu dung', 0),
(4, 2, 'Ca 2 deu sai', 1);

insert into answer (id_question, id_quiz, content, correct) values 
(5, 2, 'Encapsulation', 0),
(5, 2, 'Abstraction', 0),
(5, 2, 'Polymorphism', 1),
(5, 2, 'Inheritence', 0);

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

delimiter $$
create procedure insertQuestion(
	
)
BEGIN
	insert into questionView ()
END $$
delimiter ;
insert into questionView (quizName, Difficulty, content, a1, a2, a3, a4, c1, c2, c3, c4) values
('Thu do cac nuoc', 'hard', 'Thu do cua VN','HCM','HN','DN','Ca Mau',0,1,0,0);