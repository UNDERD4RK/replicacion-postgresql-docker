CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

INSERT INTO
    usuarios (nombre, correo)
VALUES (
        'Juan Pérez',
        'juan@example.com'
    ),
    (
        'Ana Gómez',
        'ana@example.com'
    );

CREATE DATABASE tienda;

\c tienda

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio NUMERIC(10, 2) NOT NULL
);

INSERT INTO
    productos (nombre, precio)
VALUES ('Laptop', 1500.00),
    ('Mouse', 25.50),
    ('Teclado', 45.99);