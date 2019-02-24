#!/usr/bin/env bash

sudo docker cp create-xnm-pdb.sql oracle-xe:/opt/oracle/scripts/create-xnm-pdb.sql

sudo docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.create-xnmpdb-tablespace.sql oracle-xe:/opt/oracle/scripts/create-xnmpdb-tablespace.sql

sudo docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.update-xnmpdbadmin-account.sql oracle-xe:/opt/oracle/scripts/update-xnmpdbadmin-account.sql

sudo docker cp src/main/resources/changelogs/sql/master-data/db.changelog.initial.sql.create-liquibase-schema.sql oracle-xe:/opt/oracle/scripts/db.changelog.initial.sql.create-liquibase-schema.sql

sudo docker exec -it oracle-xe bash -c "source /home/oracle/.bashrc; bash"

#RUN $ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/XE as sysdba

#@/opt/oracle/scripts/create-xnm-pdb.sql