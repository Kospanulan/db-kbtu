/* Ex 1
1. DDL - Data Definition Language used to create, drop, etc. for table.
   DML - Data Manipulation Language used to manipulate(modifying, access) data of created table.
    
    DDL - ALTER, CREATE, DROP
    DML - SELECT, DELETE, INSERT, UPDATE
*/

-- Ex 2
CREATE TABLE customers(
    id                  int NOT NULL UNIQUE,
    full_name           varchar(50) NOT NULL,
    timestamp           timestamp NOT NULL,
    delivery_address    text NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE products(
    id              varchar NOT NULL UNIQUE,
    name            varchar NOT NULL UNIQUE,
    description     text,
    price           double precision NOT NULL CHECK(price > 0),
    PRIMARY KEY(id)
);

CREATE TABLE orders(
    code            int NOT NULL UNIQUE,
    customer_id     int,
    total_sum       double precision NOT NULL CHECK(total_sum > 0),
    is_paid         boolean NOT NULL,
    PRIMARY KEY(code),
    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id) 
	        REFERENCES customers(id)
	        ON DELETE CASCADE
);

CREATE TABLE order_items(
    order_code  int NOT NULL UNIQUE,
    product_id  varchar NOT NULL UNIQUE,
    quantity    int NOT NULL CHECK(quantity > 0),
    CONSTRAINT fk_order
        FOREIGN KEY(order_code) 
	        REFERENCES orders(code)
	        ON DELETE CASCADE,
    CONSTRAINT fk_product
        FOREIGN KEY(product_id) 
	        REFERENCES products(id)
	        ON DELETE CASCADE
);

-- Ex 3
CREATE TABLE students(
    id                  int PRIMARY KEY,
    full_name           varchar(50) NOT NULL,
    age                 int NOT NULL,
    birth_date          date NOT NULL,
    gender              varchar(20) NOT NULL,
    avg_grade           double precision NOT NULL CHECK(avg_grade > 0),
    info_abt_student    text,
    dormitory_need      boolean NOT NULL,
    additional_info     text,
    group_id            int NOT NULL UNIQUE
);


CREATE TABLE instructors(
    id                  int PRIMARY KEY,
    full_name           varchar(50) NOT NULL,
    languages           varchar(50) NOT NULL,
    work_experience     varchar(20),
    remote_lessons      boolean NOT NULL
);

CREATE TABLE lesson_participants(
    id              int PRIMARY KEY,
    title           varchar(50) NOT NULL,
    instructor_id   int NOT NULL,
    group_id        int[] NOT NULL,
    room            int NOT NULL CHECK(room > 0),
    CONSTRAINT fk_instructor
        FOREIGN KEY(instructor_id)
            REFERENCES instructors(id)
            ON DELETE CASCADE
);
-- DROP TABLE lesson_participants
-- DROP TABLE instructors

CREATE TABLE groups(
    id int PRIMARY KEY,
    name varchar(20) NOT NULL,
    CONSTRAINT fk_student
        FOREIGN KEY(id)
            REFERENCES students(group_id)
            ON DELETE CASCADE
);

-- Ex 4

INSERT INTO instructors(id, full_name, languages, remote_lessons)
VALUES
(1, 'Kospan Ulan', 'Eng', False),
(2, 'Aaa Bb', 'ru', True);

UPDATE instructors
SET remote_lessons=True WHERE id=1;

DELETE FROM instructors
WHERE id=2;

SELECT * FROM instructors;







