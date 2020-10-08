#!/bin/bash
set -e

for tablespace in APPL_DATA; do
  rm -rf "/var/lib/postgresql/data/$tablespace" || true
  mkdir -p "/var/lib/postgresql/data/$tablespace" || true
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -c "DROP TABLESPACE IF EXISTS $tablespace"
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -c "CREATE TABLESPACE $tablespace LOCATION '/var/lib/postgresql/data/$tablespace'"
done

SQL_FILES=`find /sql-files/1.0/package/* -name "*.sql"`

for file in ${SQL_FILES}; do
    echo ${file}

    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f "${file}"
done
