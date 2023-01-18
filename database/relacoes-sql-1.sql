-- Active: 1673954313976@@127.0.0.1@3306

-- Prática 1
----------CRIAR TABELAS----------
CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

----------DELETAR----------
SELECT * FROM phones;
DROP TABLE phones;

SELECT * FROM users;
DROP TABLE users;

----------POPULANDO AS TABELAS----------
INSERT INTO users (id, name, email, password)
VALUES
    ("u001", "Edipo", "teste1@teste.com", "123"),
    ("u002", "Pamela", "teste2@teste.com", "456"),
    ("u003", "Mateus", "teste3@teste.com", "789");

INSERT INTO phones (id, phone_number, user_id)
VALUES
    ("p001", "11111-1111", "u001"),
    ("p002", "22222-2222", "u002"),
    ("p003", "33333-3333", "u001");

----------ACESSANDO----------
SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

-----------------------------------------------------------------------------
-- Prática 2
----------CRIAR TABELAS----------
CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

----------DELETAR----------
SELECT * FROM licenses;
DROP TABLE licenses;

SELECT * FROM drivers;
DROP TABLE drivers;

----------POPULANDO AS TABELAS----------
INSERT INTO licenses (id, register_number, category)
VALUES
    ("l001", "111", "A"),
    ("l002", "222", "B"),
    ("l003", "333", "C");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
    ("d001", "Edipo", "drivers1@teste.com", "321", "l001"),
    ("d002", "Pamela", "drivers2@teste.com", "654", "l002"),
    ("d003", "Mateus", "drivers3@teste.com", "987", "l003");

----------ACESSANDO----------
SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id; 

----------------------------------------------------------------------
-- FIXAÇÃO
CREATE TABLE clientes (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

SELECT * FROM clientes; -- VISUALIZAR
DROP TABLE clientes; --EXCLUIR

CREATE TABLE contas (
    idConta TEXT PRIMARY KEY UNIQUE NOT NULL,
    endereco TEXT NOT NULL,
    celular TEXT UNIQUE NOT NULL,
    idCliente TEXT UNIQUE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

SELECT * FROM contas; -- VISUALIZAR
DROP TABLE contas; -- EXCLUIR

INSERT INTO clientes (id, name, email)
values
    ("c001", "Edipo", "teste1@teste.com"),
    ("c002", "Pamela", "teste2@teste.com");

INSERT INTO contas (idConta, endereco, celular, idCliente)
VALUES
    ("cc001", "Rua A", "11111-1111", "c001"),
    ("cc002", "Rua B", "22222-2222", "c002");

SELECT * FROM clientes
INNER JOIN contas
ON contas.idCliente = clientes.id; 
