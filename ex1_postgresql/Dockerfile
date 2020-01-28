FROM postgres

#copy the initial script to the start-up script location on the contaier
COPY ./db_utils/db_setup/ /docker-entrypoint-initdb.d
