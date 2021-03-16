CREATE DATABASE quiz;

USE quiz;

CREATE TABLE `user` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `userName` VARCHAR(50) NOT NULL UNIQUE,
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
        REFERENCES quiz (id),
	answer1 varchar(100),
	answer2 varchar(100),
	answer3 varchar(100),
	answer4 varchar(100),
    correct varchar(100)
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
	chosen_answer varchar(100)
);


INSERT INTO user (name,userName,password,email,host) VALUES
('Son Rau','son','12345','son@gmail.com',1),
('Hien','Tung','12345','d@gmail.com',0);

INSERT INTO quiz (id_user,name,difficulty) VALUES
(1,'Do vui','easy'),
(1,'OOP','normal');

INSERT INTO question (content,id_quiz, answer1, answer2, answer3, answer4, correct)VALUES
('Hom Nay An Gi',1,'Com','Pho','Bun','Mien','Pho'),
('Ngay Mai An Gi',1,'Com','Pho','Bun','Mien','Bun'),
('Toi Nay An Gi',1,'Com','Pho','Bun','Mien','Mien'),
('OOP La Gi',2,'abc','def','fgh','rty','def'),
('Tinh Dong Goi La Gi',2,'1123','4435','6545','654','654');

INSERT INTO session(id_user,id_quiz) VALUES 
(2,1),
(2,2);

INSERT INTO playerAnswer(id_session,id_question, chosen_answer) VALUES 
(1,1,'Pho'),
(1,2,'Bun'),
(1,3,'Mien'),
(2,4,'abc'),
(2,5,'654');

