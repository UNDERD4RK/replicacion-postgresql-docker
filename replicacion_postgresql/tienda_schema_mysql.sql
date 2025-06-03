-- tienda_schema_mysql.sql

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- SERIAL en PG se convierte a INT AUTO_INCREMENT en MySQL
    nombre VARCHAR(100), -- character varying(100) en PG se convierte a VARCHAR(100)
    precio DECIMAL(10, 2) -- numeric(10,2) en PG se convierte a DECIMAL(10,2)
);

-- MySQL no necesita secuencias separadas como PostgreSQL para AUTO_INCREMENT
-- Las restricciones PRIMARY KEY se definen directamente en la columna