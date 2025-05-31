# replicacion_postgresql/slave/Dockerfile
FROM postgres:15

# Copia el script
COPY ./init_replica.sh /usr/local/bin/init_replica.sh
RUN chmod +x /usr/local/bin/init_replica.sh

# Cambia el ENTRYPOINT para que tu script se encargue de la inicialización
# Si el volumen está vacío, ejecutará pg_basebackup.
# Si el volumen ya tiene datos, simplemente iniciará PostgreSQL.
ENTRYPOINT ["/usr/local/bin/init_replica.sh"]