CREATE TABLE trainee (
    trainee_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE trainer (
    trainer_id INT PRIMARY KEY,
    name VARCHAR(50),
    expertise VARCHAR(100)
);

CREATE TABLE skills (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(50),
    trainee_id INT,
    trainer_id INT,
    FOREIGN KEY (trainee_id) REFERENCES trainee(trainee_id),
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id)
);

INSERT INTO trainee (trainee_id, name, email) VALUES
(1, 'Arun Kumar', 'arun.kumar@example.com'),
(2, 'Priya Lakshmi', 'priya.lakshmi@example.com'),
(3, 'Suresh Babu', 'suresh.babu@example.com'),
(4, 'Divya Rajan', 'divya.rajan@example.com'),
(5, 'Vigneshwaran', 'vigneshwaran@example.com'),
(6, 'Anitha Mohan', 'anitha.mohan@example.com'),
(7, 'Karthik Raja', 'karthik.raja@example.com'),
(8, 'Deepa Ramesh', 'deepa.ramesh@example.com'),
(9, 'Rajesh Kumar', 'rajesh.kumar@example.com'),
(10, 'Meena Devi', 'meena.devi@example.com');


INSERT INTO trainer (trainer_id, name, expertise) VALUES
(1, 'Ravi Chandran', 'C# & MS SQL'),
(2, 'Lakshmi Narayan', 'Python & Data Science'),
(3, 'Senthil Kumar', 'Java & MySQL'),
(4, 'Bhuvaneshwari', 'JavaScript & React'),
(5, 'Arunachalam', 'Machine Learning & AI'),
(6, 'Raghavan Iyer', 'Cloud Computing & AWS'),
(7, 'Muthu Vel', 'Cybersecurity & Ethical Hacking'),
(8, 'Saravanan', 'DevOps & CI/CD'),
(9, 'Perumal Raj', 'Big Data & Hadoop'),
(10, 'Jayalakshmi', 'Networking & CCNA');


INSERT INTO skills(skill_id, skill_name, trainee_id, trainer_id) VALUES
(1, 'C#', 1, 1),
(2, 'MS SQL Server', 1, 1),
(3, 'Python', 2, 2),
(4, 'Data Science', 2, 2),
(5, 'Java', 3, 3),
(6, 'MySQL', 3, 3),
(7, 'JavaScript', 4, 4),
(8, 'React', 4, 4),
(9, 'Machine Learning', 5, 5),
(10, 'AI', 5, 5),
(11, 'Cloud Computing', 6, 6),
(12, 'AWS', 6, 6),
(13, 'Cybersecurity', 7, 7),
(14, 'Ethical Hacking', 7, 7),
(15, 'DevOps', 8, 8),
(16, 'CI/CD', 8, 8),
(17, 'Big Data', 9, 9),
(18, 'Hadoop', 9, 9),
(19, 'Networking', 10, 10),
(20, 'CCNA', 10, 10);

--Three table joining
 select tr.name as trainer_name,sk.skill_name as Course,tn.name as Trainee
 from trainer as tr inner join skills as sk on tr.trainer_id=sk.skill_id
 inner join Trainee as tn on sk.skill_id=tn.trainee_id

 --cross join
 select s.name,c.color from Shape s cross join colors c where s.id=c.id