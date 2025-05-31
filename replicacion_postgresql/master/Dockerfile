FROM postgres:15
COPY init /docker-entrypoint-initdb.d/
# Estos archivos se montarán directamente por docker-compose, así que no necesitas COPY aquí para ellos
# COPY postgresql.conf /etc/postgresql/postgresql.conf
# COPY pg_hba.conf /etc/postgresql/pg_hba.conf