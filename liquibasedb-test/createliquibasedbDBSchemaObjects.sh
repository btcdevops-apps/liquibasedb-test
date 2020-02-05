#!/usr/bin/env bash


sudo docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.create-liquibasedbpdb.sql oracle-xe:/opt/oracle/scripts/create-liquibasedbpdb.sql

sudo docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.create-liquibasedbpdb-tablespace.sql oracle-xe:/opt/oracle/scripts/create-liquibasedbpdb-tablespace.sql

sudo docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.update-liquibasedbpdbadmin-account.sql oracle-xe:/opt/oracle/scripts/update-liquibasedbpdbadmin-account.sql

sudo docker cp src/main/resources/changelogs/sql/master-data/db.changelog.initial.sql.create-liquibase-liquibasedbschema.sql oracle-xe:/opt/oracle/scripts/create-liquibase-schema.sql

sudo docker exec -it oracle-xe bash -c "source /home/oracle/.bashrc; bash" && $ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/XE as sysdba

sudo docker exec -it oracle-xe bash -c "source /home/oracle/.bashrc; bash"

$ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/XE as sysdba

ALTER PLUGGABLE DATABASE pdb1, pdb2 CLOSE IMMEDIATE;

ALTER PLUGGABLE DATABASE ALL OPEN;

SELECT name, open_mode FROM v$pdbs;

ALTER PLUGGABLE DATABASE ALL CLOSE IMMEDIATE;

ALTER PLUGGABLE DATABASE ALL EXCEPT pdb1 OPEN;
ALTER PLUGGABLE DATABASE ALL EXCEPT xepdb1 CLOSE IMMEDIATE;
#

#RUN $ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/XE as sysdba

#@/opt/oracle/scripts/create-liquibasedbpdb.sql

#@/opt/oracle/scripts/create-liquibasedbpdb-tablespace.sql

#@/opt/oracle/scripts/create-liquibase-schema.sql

#@/opt/oracle/scripts/create-liquibasedbpdb-tablespace.sql

#@/opt/oracle/scripts/update-liquibasedbpdbadmin-account.sql

#@/opt/oracle/scripts/create-liquibase-schema.sql



#--start and stop listener if necessary--
# $ORACLE_HOME/bin/lsnrctl stop

#
#sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
#sudo chmod g+rwx "/home/$USER/.docker" -R
# cd /opt/oracle/product/18c/dbhomeXE/network/admin/
# add liquibasedbpdb = (DESCRIPTION =
#                (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
#                (CONNECT_DATA = (SERVER = SHARED)(SERVICE_NAME = liquibasedbpdb))
#        )
#---should look like this---
#XE =
#  (DESCRIPTION =
#    (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
#    (CONNECT_DATA =
#      (SERVER = DEDICATED)
#      (SERVICE_NAME = XE)
#    )
#  )
#liquibasedbpdb = (DESCRIPTION =
#                (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
#                (CONNECT_DATA = (SERVER = SHARED)(SERVICE_NAME = liquibasedbpdb))
#        )
#
#LISTENER_XE =
#  (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
#-----

#mvn compile -U -Dlocal -Ddatabase.username=liquibasedbpdb_admin -Ddatabase.password=liquibasedbpdb_admin -Ddatabase.url=jdbc:oracle:thin:@172.18.0.2:1521/liquibasedbpdb
