#!/usr/bin/env bash

#----oracle-18c-ee https://orclguru.com/2018/09/04/prebuilt-oracle-database-18c-with-docker/
##docker run -d -it -p 1980:1521 -p 1981:5500 --name=endvisprod --mount type=bind,source=/media/sf_endvidbbackup/oracledockerdb_storage,target=/hostfolder  --network=oracle_network  dockerhelp/docker-oracle-ee-18c

docker exec -it endvisprod bash -c "source /home/oracle/.bashrc; bash"
sh post_install.sh
sqlplus / as sysdba
alter pluggable database PDB18C open;
exit

#copy dataabse setup scripts into container
docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.create-xnmpdb.sql endvisprod:/media/dbscripts/create-xnmpdb.sql \
&& docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.create-xnmpdb-tablespace.sql endvisprod:/media/dbscripts/create-xnmpdb-tablespace.sql \
&& docker cp src/main/resources/changelogs/sql/initial/db.changelog.initial.sql.update-xnmpdbadmin-account.sql endvisprod:/media/dbscripts/update-xnmpdbadmin-account.sql \
&& docker cp src/main/resources/changelogs/sql/master-data/db.changelog.initial.sql.create-liquibase-xnmdbschema.sql endvisprod:/media/dbscripts/create-liquibase-schema.sql

# log into container bash
docker exec -it endvisprod bash -c "source /home/oracle/.bashrc; bash"
scp post_install.sh sql_login.sh
vi sql_login.sh
##
##!/bin/bash
set -e
export INSTALL=/
echo `hostname -I|awk '{print $1}'` `hostname -s` `hostname` >> /etc/hosts
rm -rf /u01/app/oracle/product/18.0.0/dbhome_1/network/admin/listener.ora

echo "Setting ENV"
echo oracle:oracle | chpasswd
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1
export ORACLE_SID=ORCL18 >> /home/oracle/.bashrc
export ORACLE_BASE=/u01/app/oracle >> /home/oracle/.bashrc
export ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1 >> /home/oracle/.bashrc
export PATH=$ORACLE_HOME/bin:$PATH >> /home/oracle/.bashrc

gosu oracle bash<<EOF
export ORACLE_SID=ORCL18
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1
export PATH=$ORACLE_HOME/bin:$PATH
sqlplus / as sysdba
startup;
alter system register;
alter pluggable database PDB18C open;
select name,open_mode from v\$database;
show pdbs;
EOF

echo "Cleaning up"
rm -rf /tmp/*
echo "DataBase Installed!!!"
gosu oracle  bash
######

sqlplus sys/Welcome_1@localhost/ORCL18 as sysdba

@/media/dbscripts/create-xnmpdb.sql

#exit sql session
exit

#connect to db endvisprodpdb as sys
sqlplus sys/Welcome_1@localhost/xnmpdb as sysdba

#run database provisioning scripts for liquibase and endvis
@/media/dbscripts/create-xnmpdb.sql
@/media/dbscripts/create-xnmpdb-tablespace.sql
@/media/dbscripts/update-xnmpdbadmin-account.sql
@/media/dbscripts/create-liquibase-schema.sql

#-----end oracle18c-ee----

#copy dataabse setup scripts into container

