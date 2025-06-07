#!/bin/bash
set -e

DATA_DIR="/var/lib/postgresql/data"

# Exportar la contraseña para pg_basebackup y psql si es necesario
export PGPASSWORD=$POSTGRES_PASSWORD

# Verificar si el directorio de datos de PostgreSQL ya está inicializado
if [ ! -s "$DATA_DIR/PG_VERSION" ]; then
    echo "PostgreSQL data directory is empty. Initiating base backup from master..."

    until pg_basebackup -h pg-master -D "$DATA_DIR" -U postgres -Fp -Xs -P -R --verbose
    do
        echo "Waiting for master to be ready for replication (trying pg_basebackup again)..."
        sleep 2
    done

    echo "Base backup completed successfully. Starting PostgreSQL as a replica."
else
    echo "PostgreSQL data directory already initialized. Starting PostgreSQL server."
fi

# Este comando es el ENTRYPOINT original de la imagen de Postgres.
# Lo llamamos aquí para que el servidor PostgreSQL inicie,
# ya sea que se haya hecho un pg_basebackup o que los datos ya existieran.
exec docker-entrypoint.sh postgres -c hot_standby=on

pg_basebackup -h pg-master -D "$DATA_DIR" -U replicator ...
