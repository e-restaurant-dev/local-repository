CREATE TABLE restaurants (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE restaurant_branch (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    restaurant_id INT REFERENCES restaurants(id) NOT NULL,
    street VARCHAR(255) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    country VARCHAR(255) NULL,
    city VARCHAR(255) NULL
);

CREATE TABLE admin_users (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(255) NULL,
    restaurant_id INT REFERENCES restaurants(id),
    password VARCHAR(255) NOT NULL
);

CREATE TABLE worker_rights (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE worker_roles (
    title VARCHAR(255) PRIMARY KEY,
    rights INT[]
);

CREATE TABLE worker_users (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_id INT REFERENCES restaurant_branch(id) NOT NULL,
    name VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    role VARCHAR(255) REFERENCES worker_roles(title)
);