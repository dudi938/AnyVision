#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "anyVision" <<-EOSQL
    CREATE TABLE employees_tbl(id SERIAL, firstName text, lastName text);
    INSERT INTO  employees_tbl(firstName,lastName) values('David','Gershtenkoren');
    INSERT INTO  employees_tbl(firstName,lastName) values('Moshe','Yanetz');
EOSQL
