#!/usr/bin/env bash


sudo docker cp src/main/resources/changelogs/sql/initial/db.changelog.intial.sql.create-xnmpdb.sql oracle-xe:/opt/oracle/scripts/create-xnmpdb.sql

sudo docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.create-xnmpdb-tablespace.sql oracle-xe:/opt/oracle/scripts/create-xnmpdb-tablespace.sql

sudo docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.update-xnmpdbadmin-account.sql oracle-xe:/opt/oracle/scripts/update-xnmpdbadmin-account.sql

sudo docker cp src/main/resources/changelogs/sql/master-data/db.changelog.initial.sql.create-liquibase-schema.sql oracle-xe:/opt/oracle/scripts/create-liquibase-schema.sql

sudo docker exec -it oracle-xe bash -c "source /home/oracle/.bashrc; bash"

$ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/XE as sysdba

ALTER PLUGGABLE DATABASE OPEN READ WRITE;
#
ALTER PLUGGABLE DATABASE pdb1, pdb2 OPEN READ ONLY FORCE;
ALTER PLUGGABLE DATABASE pdb1, pdb2 CLOSE IMMEDIATE;

ALTER PLUGGABLE DATABASE ALL OPEN;
ALTER PLUGGABLE DATABASE ALL CLOSE IMMEDIATE;

ALTER PLUGGABLE DATABASE ALL EXCEPT pdb1 OPEN;
ALTER PLUGGABLE DATABASE ALL EXCEPT pdb1 CLOSE IMMEDIATE;
#

#RUN $ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/XE as sysdba

#@/opt/oracle/scripts/create-xnmpdb.sql

#@/opt/oracle/scripts/create-xnmpdb-tablespace.sql

#@/opt/oracle/scripts/update-xnmpdbadmin-account.sql

#@/opt/oracle/scripts/create-liquibase-schema.sql



#--start and stop listener if necessary--
# $ORACLE_HOME/bin/lsnrctl stop

#
#sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
#sudo chmod g+rwx "/home/$USER/.docker" -R
# cd /opt/oracle/product/18c/dbhomeXE/network/admin/
# add XNMPDB = (DESCRIPTION =
#                (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
#                (CONNECT_DATA = (SERVER = SHARED)(SERVICE_NAME = XNMPDB))
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
#XNMPDB = (DESCRIPTION =
#                (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
#                (CONNECT_DATA = (SERVER = SHARED)(SERVICE_NAME = XNMPDB))
#        )
#
#LISTENER_XE =
#  (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
#-----

#mvn compile -U -Dlocal -Ddatabase.username=xnmpdb_admin -Ddatabase.password=xnmpdb_admin -Ddatabase.url=jdbc:oracle:thin:@172.18.0.2:1521/XNMPDB
