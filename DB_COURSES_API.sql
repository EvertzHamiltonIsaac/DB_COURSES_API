CREATE TABLE "users" (
  "id_user" uuid PRIMARY KEY,
  "name" varchar(50),
  "email" varchar(25),
  "password" varchar(20),
  "age" int,
  "id_role" int
);

CREATE TABLE "courses" (
  "id_course" serial PRIMARY KEY,
  "title" varchar(50),
  "description" varchar,
  "id_level" int,
  "id_teacher" uuid
);

CREATE TABLE "course_video" (
  "id_course_video" serial PRIMARY KEY,
  "title" varchar(50),
  "url" varchar,
  "id_course" int
);

CREATE TABLE "categories" (
  "id_category" serial PRIMARY KEY,
  "name" varchar(20)
);

CREATE TABLE "roles" (
  "id_role" serial PRIMARY KEY,
  "name" varchar(25)
);

CREATE TABLE "levels" (
  "id_level" serial PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "teachers" (
  "id_teacher" uuid PRIMARY KEY,
  "name" varchar(50),
  "email" varchar(25)
);

CREATE TABLE "users_courses" (
  "id_users_courses" serial PRIMARY KEY,
  "id_user" uuid,
  "id_course" int,
  "porcent" int,
  "review" text
);

CREATE TABLE "courses_categories" (
  "id_courses_categories" serial PRIMARY KEY,
  "id_course" int,
  "id_category" int
);

ALTER TABLE "courses" ADD FOREIGN KEY ("id_teacher") REFERENCES "teachers" ("id_teacher");

ALTER TABLE "course_video" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id_course");

ALTER TABLE "users" ADD FOREIGN KEY ("id_role") REFERENCES "roles" ("id_role");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_level") REFERENCES "levels" ("id_level");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id_course");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("id_category") REFERENCES "categories" ("id_category");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id_course");


-- inserts, create data. and optionals

--roles
INSERT INTO roles (name) VALUES ('student');
INSERT INTO roles (name) VALUES ('teacher');
INSERT INTO roles (name) VALUES ('admin');
--categories 
INSERT INTO categories (name) VALUES ('cocina');
INSERT INTO categories (name) VALUES ('diseño');
INSERT INTO categories (name) VALUES ('comunicacion');
INSERT INTO categories (name) VALUES ('programacion');
--levels 
INSERT INTO levels (name) VALUES ('beginner');
INSERT INTO levels (name) VALUES ('medium');
INSERT INTO levels (name) VALUES ('advanced');
--course_video
INSERT INTO course_video (title,url,id_course) VALUES ('class 1','url 1', 1);
INSERT INTO course_video (title,url,id_course) VALUES ('class 1','url 1', 2);
--teachers
INSERT INTO teachers (id_teacher , name, email) VALUES ('7457ca8e-d206-4814-b47e-352148a7fc6a','juan','juan@gmail.com');
INSERT INTO teachers (id_teacher , name, email) VALUES ('6957f04a-dfca-4260-9b05-4aa3c392869b','pedro','pedro@gmail.com');
--courses
INSERT INTO courses (title,description,id_level,id_teacher) VALUES ('JavaScript','description example 1',1,'6957f04a-dfca-4260-9b05-4aa3c392869b');
INSERT INTO courses (title,description,id_level,id_teacher) VALUES ('HTML and CSS','description example 2',3,'7457ca8e-d206-4814-b47e-352148a7fc6a');
--users

insert
	into
	users (id_user,
	name,
	email,
	"password",
	age,
	id_role)
values (
	'78cd58b4-8f9f-482c-b8b1-ff1af29a84ab',
	'jose',
	'jose@gmail.com',
	'1234567890',
	19,
	3
);

insert
	into
	users (id_user,
	name,
	email,
	"password",
	age,
	id_role)
values (
	'0e8184f4-bcc5-4366-8214-6a1baf5802ed',
	'claudio',
	'claudio@gmail.com',
	'0987654321',
	25,
	2
);

--users_courses
insert
	into
	users_courses (id_user,
	id_course,
	porcent,
	review)
values ('78cd58b4-8f9f-482c-b8b1-ff1af29a84ab',
1,
70,
'This is a review example');

insert
	into
	users_courses (id_user,
	id_course,
	porcent,
	review)
values ('0e8184f4-bcc5-4366-8214-6a1baf5802ed',
2,
60,
'This is another review example');

--courses_categories
insert into courses_categories (id_course,id_category) values (1,4);
insert into courses_categories (id_course,id_category) values (2,4);

-- JOIN ---> Opcional
--Podria filtrar mas la informacion del la salida del Left join, pero lo dejare asi por fines didacticos
--lo mencionó porque se repite varia veces el id del curso y cosas asi. 

SELECT * FROM courses
LEFT JOIN course_video ON courses.id_course  = course_video.id_course
LEFT JOIN users_courses ON courses.id_course  = users_courses.id_course
LEFT JOIN courses_categories ON courses.id_course  = courses_categories.id_course;










