/* 1NF */
DROP TABLE test;
CREATE TABLE test (
  v1 VARCHAR(12),
  v2 INT,
  PRIMARY KEY(v1,v2)
);
/* 2NF */
CREATE TABLE positions(
  name VARCHAR(64) PRIMARY KEY,
  car_aviability BOOLEAN
);
/* */
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(64),
  position VARCHAR(32) REFERENCES positions,
);
/* 3NF */

CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  name,
  phone_number
);

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(64),
  department REFERENCES departments
);

INSERT INTO employees (name, department, department_number)
VALUES 
('t1 f1', 'HR'),
('t2 f2', 'Sales'),
('t3 f3', 'Sales');

/* BCNF */
/*
  teachers
  students
  subjects
  teacher n:1 subjects
  students m:n subjects
  students m:n teachers
*/
CREATE TABLE students (id SERIAL PRIMARY KEY);
CREATE TABLE subjects (name SERIAL PRIMARY KEY)
CREATE TABLE teachers (
  id SERIAL PRIMARY KEY, 
  "subject" VARCHAR(64) REFERENCES subjects
);

CREATE TABLE students_to_teachers(
  teacher_id INT REFERENCES teachers,
  student_id INT REFERENCES students,
  PRIMARY KEY (teacher_id, student_id)
);
/* 4NF */

/*
  restaurants
  pizza
  delivery_services
*/


CREATE TABLE pizzas("name" VARCHAR(64) PRIMARY KEY);
CREATE TABLE restaurants (id SERIAL PRIMARY KEY);
CREATE TABLE delivery_services (id SERIAL PRIMARY KEY);
CREATE TABLE pizza_to_restaurant(
  pizza_name VARCHAR(64) REFERENCES pizzas, 
  restaurant_id REFERENCES restaurants
);
CREATE TABLE restaurants_to_deliveries (
  restaurant_id INT REFERENCES restaurants,
  delivery_id INT REFERENCES delivery_services,
  PRIMARY KEY(restaurant_id, delivery_id)
);

INSERT INTO restaurants_to_deliveries
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),

/* Нормализация */

CREATE TABLE "goods" (
"id" SERIAL PRIMARY KEY,
"name" VARCHAR (100) NOT NULL CHECK ("name" !=''),
"price" INTEGER NOT NULL CHECK ("price" > 0)
);

CREATE TABLE "orders" (
  "order_id" SERIAL,
  "customer_id" INTEGER REFERENCES "customers" ("id"),
  "contruct_number" VARCHAR (120) NOT NULL CHECK("contruct_numbre" !=''),
  "date" DATE NOT NULL DEFAULT CURRENT_DATE,
  "name" VARCHAR (100) REFERENCES "goods" ("name"),
  "planned_delivery" INTEGER NOT NULL CHECK ("planned_delivery" > 0)
);

CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "customer_name" VARCHAR (100),
  "address" VARCHAR (256) NOT NULL CHECK ("address" !=''),
  "phone" VARCHAR (20) NOT NULL CHECK ("phone" !='')
);


CREATE TABLE "shipment" (
  "shipment_id",
  "order_id",
  "shipment_date",
  "quantity"
);

